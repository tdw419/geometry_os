; DESCRIPTION: Creates a red rectangular region at (51, 149) spanning 51 by 89 pixels.
; PLAN: r0=51(x), r1=149(y), r2=51(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 149
LDI r2, 51
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
