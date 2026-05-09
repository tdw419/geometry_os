; DESCRIPTION: Composite: Renders a orange box of size 46x18 starting at (144, 10) then Renders a magenta line between points (50, 5) and (449, 183) then Places a purple circle of radius 69 at center (264, 86).
; PLAN: r0=144(x), r1=10(y), r2=46(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x1), r6=5(y1), r7=449(x2), r8=183(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=86(y), r12=69(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 10
LDI r2, 46
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 5
LDI r7, 449
LDI r8, 183
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 86
LDI r12, 69
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
