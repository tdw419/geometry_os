; DESCRIPTION: Composite: Sets a single blue pixel at (56, 75) then Renders a yellow box of size 22x90 starting at (60, 110) then Places a blue line segment connecting (57, 189) to (92, 230).
; PLAN: r0=56(x), r1=75(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=110(y), r7=22(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x1), r11=189(y1), r12=92(x2), r13=230(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 75
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 110
LDI r7, 22
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 189
LDI r12, 92
LDI r13, 230
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
