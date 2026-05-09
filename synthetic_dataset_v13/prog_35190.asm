; DESCRIPTION: Composite: Places a black circle of radius 31 at center (202, 130) then Renders a magenta box of size 28x96 starting at (302, 133) then Places a magenta line segment connecting (208, 210) to (147, 36).
; PLAN: r0=202(x), r1=130(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=133(y), r7=28(width), r8=96(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x1), r11=210(y1), r12=147(x2), r13=36(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 130
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 133
LDI r7, 28
LDI r8, 96
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 210
LDI r12, 147
LDI r13, 36
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
