; DESCRIPTION: Creates a magenta rectangular region at (350, 51) spanning 94 by 115 pixels.
; PLAN: r0=350(x), r1=51(y), r2=94(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 51
LDI r2, 94
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
