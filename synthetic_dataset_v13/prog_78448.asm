; DESCRIPTION: Composite: Draws a red circle centered at (426, 133) with radius 69 then Draws a blue line from (90, 154) to (108, 162) then Places a green 29x77 rectangle at position (245, 158).
; PLAN: r0=426(x), r1=133(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x1), r6=154(y1), r7=108(x2), r8=162(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=158(y), r12=29(width), r13=77(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 133
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 154
LDI r7, 108
LDI r8, 162
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 158
LDI r12, 29
LDI r13, 77
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
