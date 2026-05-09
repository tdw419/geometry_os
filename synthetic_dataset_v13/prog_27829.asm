; DESCRIPTION: Draws a white rectangle at (373, 108) with width 57 and height 25.
; PLAN: r0=373(x), r1=108(y), r2=57(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 108
LDI r2, 57
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
