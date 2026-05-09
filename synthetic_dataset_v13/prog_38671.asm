; DESCRIPTION: Creates a magenta rectangular region at (196, 181) spanning 92 by 37 pixels.
; PLAN: r0=196(x), r1=181(y), r2=92(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 181
LDI r2, 92
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
