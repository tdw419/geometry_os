; DESCRIPTION: Creates a magenta rectangular region at (120, 11) spanning 90 by 15 pixels.
; PLAN: r0=120(x), r1=11(y), r2=90(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 11
LDI r2, 90
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
