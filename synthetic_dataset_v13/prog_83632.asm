; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (459, 50) then Renders a orange line between points (267, 193) and (102, 126) then Renders a black box of size 50x16 starting at (332, 28).
; PLAN: r0=459(x), r1=50(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x1), r6=193(y1), r7=102(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=28(y), r12=50(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 50
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 193
LDI r7, 102
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 28
LDI r12, 50
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
