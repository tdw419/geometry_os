; DESCRIPTION: Creates a magenta rectangular region at (133, 154) spanning 84 by 51 pixels.
; PLAN: r0=133(x), r1=154(y), r2=84(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 154
LDI r2, 84
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
