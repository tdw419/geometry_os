; DESCRIPTION: Composite: Places a black line segment connecting (6, 130) to (156, 114) then Renders a magenta disk with center (424, 89) and radius 11 then Renders a black box of size 120x91 starting at (297, 82).
; PLAN: r0=6(x1), r1=130(y1), r2=156(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=89(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=82(y), r12=120(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 130
LDI r2, 156
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 89
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 82
LDI r12, 120
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
