; DESCRIPTION: Composite: Draws a white line from (31, 242) to (121, 157) then Draws a red circle centered at (139, 176) with radius 60 then Places a yellow dot at position (132, 52).
; PLAN: r0=31(x1), r1=242(y1), r2=121(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=176(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=52(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 242
LDI r2, 121
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 176
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 52
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
