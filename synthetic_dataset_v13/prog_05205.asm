; DESCRIPTION: Composite: Creates a blue rectangular region at (39, 174) spanning 100 by 66 pixels then Draws a white line from (19, 236) to (43, 93) then Renders a blue disk with center (397, 180) and radius 41.
; PLAN: r0=39(x), r1=174(y), r2=100(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=236(y1), r7=43(x2), r8=93(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=180(y), r12=41(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 174
LDI r2, 100
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 236
LDI r7, 43
LDI r8, 93
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 180
LDI r12, 41
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
