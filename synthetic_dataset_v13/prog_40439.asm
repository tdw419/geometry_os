; DESCRIPTION: Composite: Renders a black box of size 45x99 starting at (81, 65) then Places a white circle of radius 34 at center (65, 54) then Renders a yellow line between points (239, 90) and (176, 231).
; PLAN: r0=81(x), r1=65(y), r2=45(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=54(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x1), r11=90(y1), r12=176(x2), r13=231(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 65
LDI r2, 45
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 54
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 90
LDI r12, 176
LDI r13, 231
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
