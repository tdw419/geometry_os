; DESCRIPTION: Composite: Places a purple circle of radius 38 at center (209, 180) then Draws a cyan line from (484, 32) to (193, 127) then Draws a magenta rectangle at (88, 49) with width 45 and height 111.
; PLAN: r0=209(x), r1=180(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=32(y1), r7=193(x2), r8=127(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=49(y), r12=45(width), r13=111(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 180
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 32
LDI r7, 193
LDI r8, 127
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 49
LDI r12, 45
LDI r13, 111
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
