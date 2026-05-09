; DESCRIPTION: Composite: Places a yellow dot at position (311, 157) then Draws a black line from (382, 244) to (341, 70) then Draws a cyan circle centered at (165, 128) with radius 69.
; PLAN: r0=311(x), r1=157(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=244(y1), r7=341(x2), r8=70(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=128(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 157
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 382
LDI r6, 244
LDI r7, 341
LDI r8, 70
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 128
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
