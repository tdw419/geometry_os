; DESCRIPTION: Composite: Draws a black line from (263, 204) to (389, 59) then Draws a magenta rectangle at (49, 29) with width 84 and height 70 then Creates a cyan circular shape at (199, 161) with radius 44.
; PLAN: r0=263(x1), r1=204(y1), r2=389(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=29(y), r7=84(width), r8=70(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=161(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 204
LDI r2, 389
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 29
LDI r7, 84
LDI r8, 70
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 161
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
