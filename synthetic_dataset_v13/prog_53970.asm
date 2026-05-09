; DESCRIPTION: Composite: Creates a purple rectangular region at (375, 93) spanning 19 by 77 pixels then Draws a orange circle centered at (174, 127) with radius 54.
; PLAN: r0=375(x), r1=93(y), r2=19(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=127(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 93
LDI r2, 19
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 127
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
