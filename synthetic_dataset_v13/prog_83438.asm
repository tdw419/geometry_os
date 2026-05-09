; DESCRIPTION: Creates a red rectangular region at (243, 23) spanning 51 by 106 pixels.
; PLAN: r0=243(x), r1=23(y), r2=51(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 23
LDI r2, 51
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
