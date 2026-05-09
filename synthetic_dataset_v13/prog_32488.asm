; DESCRIPTION: Creates a magenta rectangular region at (358, 103) spanning 36 by 108 pixels.
; PLAN: r0=358(x), r1=103(y), r2=36(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 103
LDI r2, 36
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
