; DESCRIPTION: Composite: Renders a magenta box of size 97x29 starting at (338, 157) then Places a magenta line segment connecting (14, 242) to (136, 130) then Places a black dot at position (120, 255).
; PLAN: r0=338(x), r1=157(y), r2=97(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=242(y1), r7=136(x2), r8=130(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=120(x), r11=255(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 157
LDI r2, 97
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 242
LDI r7, 136
LDI r8, 130
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 255
LDI r12, 0x000000
PSET r10, r11, r12
HALT
