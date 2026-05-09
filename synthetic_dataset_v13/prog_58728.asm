; DESCRIPTION: Creates a red rectangular region at (84, 127) spanning 18 by 89 pixels.
; PLAN: r0=84(x), r1=127(y), r2=18(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 127
LDI r2, 18
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
