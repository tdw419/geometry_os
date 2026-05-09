; DESCRIPTION: Creates a magenta rectangular region at (262, 6) spanning 51 by 88 pixels.
; PLAN: r0=262(x), r1=6(y), r2=51(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 6
LDI r2, 51
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
