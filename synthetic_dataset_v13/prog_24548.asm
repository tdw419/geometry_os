; DESCRIPTION: Composite: Places a green dot at position (179, 38) then Renders a purple box of size 84x37 starting at (56, 120) then Draws a red circle centered at (169, 68) with radius 28.
; PLAN: r0=179(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=120(y), r7=84(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=68(y), r12=28(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 56
LDI r6, 120
LDI r7, 84
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 68
LDI r12, 28
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
