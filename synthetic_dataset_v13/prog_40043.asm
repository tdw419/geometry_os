; DESCRIPTION: Creates a magenta rectangular region at (491, 5) spanning 20 by 90 pixels.
; PLAN: r0=491(x), r1=5(y), r2=20(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 5
LDI r2, 20
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
