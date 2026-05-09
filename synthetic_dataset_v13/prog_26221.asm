; DESCRIPTION: Composite: Places a yellow line segment connecting (303, 180) to (436, 212) then Places a magenta dot at position (35, 47) then Draws a red rectangle at (62, 197) with width 70 and height 21.
; PLAN: r0=303(x1), r1=180(y1), r2=436(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=47(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=62(x), r11=197(y), r12=70(width), r13=21(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 180
LDI r2, 436
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 47
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 62
LDI r11, 197
LDI r12, 70
LDI r13, 21
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
