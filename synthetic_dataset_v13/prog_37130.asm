; DESCRIPTION: Composite: Creates a green circular shape at (317, 163) with radius 52 then Renders a purple box of size 63x48 starting at (156, 73) then Places a blue line segment connecting (210, 87) to (88, 47).
; PLAN: r0=317(x), r1=163(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=73(y), r7=63(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x1), r11=87(y1), r12=88(x2), r13=47(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 163
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 73
LDI r7, 63
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 87
LDI r12, 88
LDI r13, 47
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
