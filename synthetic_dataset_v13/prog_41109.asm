; DESCRIPTION: Creates a magenta rectangular region at (113, 112) spanning 68 by 73 pixels.
; PLAN: r0=113(x), r1=112(y), r2=68(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 112
LDI r2, 68
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
