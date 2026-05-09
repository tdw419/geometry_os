; DESCRIPTION: Composite: Sets a single orange pixel at (149, 219) then Places a green 99x116 rectangle at position (38, 13) then Places a blue circle of radius 10 at center (70, 123).
; PLAN: r0=149(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=13(y), r7=99(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x), r11=123(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 38
LDI r6, 13
LDI r7, 99
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 123
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
