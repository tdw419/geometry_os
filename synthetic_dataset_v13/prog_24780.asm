; DESCRIPTION: Composite: Draws a yellow line from (34, 0) to (356, 66) then Places a orange dot at position (443, 56).
; PLAN: r0=34(x1), r1=0(y1), r2=356(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=56(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 0
LDI r2, 356
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 56
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
