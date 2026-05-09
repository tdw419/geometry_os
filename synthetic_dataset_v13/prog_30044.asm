; DESCRIPTION: Creates a magenta rectangular region at (256, 127) spanning 72 by 81 pixels.
; PLAN: r0=256(x), r1=127(y), r2=72(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 127
LDI r2, 72
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
