; DESCRIPTION: Creates a magenta rectangular region at (73, 107) spanning 56 by 63 pixels.
; PLAN: r0=73(x), r1=107(y), r2=56(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 107
LDI r2, 56
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
