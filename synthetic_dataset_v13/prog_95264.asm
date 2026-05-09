; DESCRIPTION: Composite: Places a purple circle of radius 65 at center (171, 70) then Draws a orange rectangle at (459, 132) with width 29 and height 52.
; PLAN: r0=171(x), r1=70(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x), r6=132(y), r7=29(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 70
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 132
LDI r7, 29
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
