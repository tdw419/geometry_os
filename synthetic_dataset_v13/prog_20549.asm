; DESCRIPTION: Composite: Draws a black rectangle at (306, 40) with width 108 and height 108 then Places a red line segment connecting (186, 72) to (435, 43).
; PLAN: r0=306(x), r1=40(y), r2=108(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=72(y1), r7=435(x2), r8=43(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 40
LDI r2, 108
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 72
LDI r7, 435
LDI r8, 43
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
