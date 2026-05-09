; DESCRIPTION: Composite: Places a black line segment connecting (284, 80) to (297, 110) then Renders a red disk with center (391, 186) and radius 66 then Renders a blue box of size 87x28 starting at (4, 161).
; PLAN: r0=284(x1), r1=80(y1), r2=297(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=186(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=161(y), r12=87(width), r13=28(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 80
LDI r2, 297
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 186
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 161
LDI r12, 87
LDI r13, 28
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
