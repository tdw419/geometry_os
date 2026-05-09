; DESCRIPTION: Creates a magenta rectangular region at (399, 15) spanning 47 by 65 pixels.
; PLAN: r0=399(x), r1=15(y), r2=47(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 15
LDI r2, 47
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
