; DESCRIPTION: Creates a magenta rectangular region at (338, 112) spanning 29 by 93 pixels.
; PLAN: r0=338(x), r1=112(y), r2=29(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 112
LDI r2, 29
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
