; DESCRIPTION: Creates a magenta rectangular region at (45, 59) spanning 51 by 92 pixels.
; PLAN: r0=45(x), r1=59(y), r2=51(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 59
LDI r2, 51
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
