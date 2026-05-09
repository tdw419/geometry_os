; DESCRIPTION: Composite: Places a red line segment connecting (301, 79) to (263, 180) then Draws a magenta rectangle at (479, 85) with width 26 and height 14 then Draws a green circle centered at (326, 108) with radius 74.
; PLAN: r0=301(x1), r1=79(y1), r2=263(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=85(y), r7=26(width), r8=14(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x), r11=108(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 79
LDI r2, 263
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 85
LDI r7, 26
LDI r8, 14
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 108
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
