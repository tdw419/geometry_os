; DESCRIPTION: Composite: Places a black 86x72 rectangle at position (3, 6) then Renders a yellow line between points (266, 151) and (301, 126) then Draws a orange circle centered at (446, 32) with radius 30.
; PLAN: r0=3(x), r1=6(y), r2=86(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=151(y1), r7=301(x2), r8=126(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=32(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 6
LDI r2, 86
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 151
LDI r7, 301
LDI r8, 126
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 32
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
