; DESCRIPTION: Composite: Creates a cyan circular shape at (370, 194) with radius 24 then Places a orange dot at position (235, 101) then Draws a red line from (377, 178) to (73, 89).
; PLAN: r0=370(x), r1=194(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=101(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=377(x1), r11=178(y1), r12=73(x2), r13=89(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 194
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 101
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 377
LDI r11, 178
LDI r12, 73
LDI r13, 89
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
