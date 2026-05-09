; DESCRIPTION: Composite: Renders a black disk with center (344, 50) and radius 42 then Places a blue line segment connecting (238, 15) to (510, 126) then Places a green 18x37 rectangle at position (340, 154).
; PLAN: r0=344(x), r1=50(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x1), r6=15(y1), r7=510(x2), r8=126(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=154(y), r12=18(width), r13=37(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 50
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 15
LDI r7, 510
LDI r8, 126
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 154
LDI r12, 18
LDI r13, 37
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
