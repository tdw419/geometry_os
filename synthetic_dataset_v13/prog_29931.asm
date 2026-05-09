; DESCRIPTION: Composite: Draws a white line from (301, 50) to (291, 119) then Draws a purple rectangle at (282, 92) with width 30 and height 33 then Draws a cyan circle centered at (337, 195) with radius 59.
; PLAN: r0=301(x1), r1=50(y1), r2=291(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=92(y), r7=30(width), r8=33(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=195(y), r12=59(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 50
LDI r2, 291
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 92
LDI r7, 30
LDI r8, 33
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 195
LDI r12, 59
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
