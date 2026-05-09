; DESCRIPTION: Creates a magenta rectangular region at (206, 72) spanning 119 by 87 pixels.
; PLAN: r0=206(x), r1=72(y), r2=119(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 72
LDI r2, 119
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
