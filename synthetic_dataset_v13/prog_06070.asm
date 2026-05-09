; DESCRIPTION: Creates a blue rectangular region at (117, 149) spanning 51 by 73 pixels.
; PLAN: r0=117(x), r1=149(y), r2=51(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 149
LDI r2, 51
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
