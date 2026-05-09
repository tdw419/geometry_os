; DESCRIPTION: Composite: Draws a red line from (348, 10) to (313, 210) then Places a magenta 97x62 rectangle at position (226, 96) then Renders a black disk with center (243, 46) and radius 27.
; PLAN: r0=348(x1), r1=10(y1), r2=313(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=96(y), r7=97(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=46(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 10
LDI r2, 313
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 96
LDI r7, 97
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 46
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
