; DESCRIPTION: Creates a magenta rectangular region at (399, 151) spanning 52 by 68 pixels.
; PLAN: r0=399(x), r1=151(y), r2=52(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 151
LDI r2, 52
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
