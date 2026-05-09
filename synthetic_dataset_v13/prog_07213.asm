; DESCRIPTION: Composite: Draws a white line from (8, 178) to (281, 221) then Places a yellow dot at position (331, 163).
; PLAN: r0=8(x1), r1=178(y1), r2=281(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=163(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 178
LDI r2, 281
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 163
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
