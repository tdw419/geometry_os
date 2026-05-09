; DESCRIPTION: Draws a red rectangle at (373, 60) with width 32 and height 97.
; PLAN: r0=373(x), r1=60(y), r2=32(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 60
LDI r2, 32
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
