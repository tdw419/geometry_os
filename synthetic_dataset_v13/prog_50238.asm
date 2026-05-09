; DESCRIPTION: Composite: Creates a black circular shape at (232, 87) with radius 20 then Places a cyan line segment connecting (198, 10) to (82, 101) then Renders a purple box of size 99x81 starting at (82, 21).
; PLAN: r0=232(x), r1=87(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x1), r6=10(y1), r7=82(x2), r8=101(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=21(y), r12=99(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 87
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 10
LDI r7, 82
LDI r8, 101
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 21
LDI r12, 99
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
