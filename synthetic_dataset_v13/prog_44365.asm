; DESCRIPTION: Composite: Sets a single blue pixel at (60, 224) then Draws a yellow line from (109, 157) to (304, 215) then Draws a red circle centered at (132, 30) with radius 28.
; PLAN: r0=60(x), r1=224(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=157(y1), r7=304(x2), r8=215(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=30(y), r12=28(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 224
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 157
LDI r7, 304
LDI r8, 215
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 30
LDI r12, 28
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
