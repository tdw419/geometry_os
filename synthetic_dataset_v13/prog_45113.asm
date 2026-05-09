; DESCRIPTION: Creates a magenta rectangular region at (293, 5) spanning 23 by 93 pixels.
; PLAN: r0=293(x), r1=5(y), r2=23(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 5
LDI r2, 23
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
