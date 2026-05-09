; DESCRIPTION: Creates a magenta rectangular region at (442, 86) spanning 52 by 90 pixels.
; PLAN: r0=442(x), r1=86(y), r2=52(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 86
LDI r2, 52
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
