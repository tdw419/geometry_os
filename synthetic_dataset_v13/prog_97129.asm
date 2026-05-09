; DESCRIPTION: Composite: Places a yellow circle of radius 21 at center (182, 70) then Places a black line segment connecting (276, 42) to (1, 226) then Renders a white box of size 115x54 starting at (56, 123).
; PLAN: r0=182(x), r1=70(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=42(y1), r7=1(x2), r8=226(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=123(y), r12=115(width), r13=54(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 70
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 42
LDI r7, 1
LDI r8, 226
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 123
LDI r12, 115
LDI r13, 54
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
