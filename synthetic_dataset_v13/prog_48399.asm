; DESCRIPTION: Composite: Draws a blue rectangle at (460, 7) with width 40 and height 107 then Renders a orange line between points (186, 44) and (397, 133).
; PLAN: r0=460(x), r1=7(y), r2=40(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=44(y1), r7=397(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 7
LDI r2, 40
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 44
LDI r7, 397
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
