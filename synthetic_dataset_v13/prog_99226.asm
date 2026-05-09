; DESCRIPTION: Composite: Places a yellow line segment connecting (130, 221) to (19, 79) then Places a yellow dot at position (243, 139).
; PLAN: r0=130(x1), r1=221(y1), r2=19(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=139(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 221
LDI r2, 19
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 139
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
