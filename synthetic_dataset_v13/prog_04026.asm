; DESCRIPTION: Composite: Sets a single purple pixel at (105, 59) then Renders a yellow line between points (35, 157) and (43, 146) then Renders a green box of size 38x54 starting at (320, 149).
; PLAN: r0=105(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=157(y1), r7=43(x2), r8=146(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=149(y), r12=38(width), r13=54(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 157
LDI r7, 43
LDI r8, 146
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 149
LDI r12, 38
LDI r13, 54
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
