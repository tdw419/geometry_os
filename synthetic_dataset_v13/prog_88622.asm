; DESCRIPTION: Creates a red rectangular region at (165, 110) spanning 106 by 51 pixels.
; PLAN: r0=165(x), r1=110(y), r2=106(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 110
LDI r2, 106
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
