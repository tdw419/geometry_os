; DESCRIPTION: Composite: Places a green circle of radius 60 at center (393, 112) then Renders a white box of size 43x11 starting at (334, 182) then Places a purple line segment connecting (77, 146) to (474, 167).
; PLAN: r0=393(x), r1=112(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=182(y), r7=43(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=77(x1), r11=146(y1), r12=474(x2), r13=167(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 112
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 182
LDI r7, 43
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 146
LDI r12, 474
LDI r13, 167
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
