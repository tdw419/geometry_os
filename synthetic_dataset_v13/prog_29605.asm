; DESCRIPTION: Composite: Draws a black circle centered at (366, 176) with radius 45 then Draws a cyan line from (306, 22) to (166, 84).
; PLAN: r0=366(x), r1=176(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=22(y1), r7=166(x2), r8=84(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 176
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 22
LDI r7, 166
LDI r8, 84
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
