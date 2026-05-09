; DESCRIPTION: Creates a magenta rectangular region at (398, 60) spanning 18 by 51 pixels.
; PLAN: r0=398(x), r1=60(y), r2=18(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 60
LDI r2, 18
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
