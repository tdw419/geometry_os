; DESCRIPTION: Creates a magenta rectangular region at (64, 89) spanning 10 by 92 pixels.
; PLAN: r0=64(x), r1=89(y), r2=10(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 89
LDI r2, 10
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
