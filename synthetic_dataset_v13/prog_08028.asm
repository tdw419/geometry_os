; DESCRIPTION: Creates a purple rectangular region at (327, 149) spanning 73 by 74 pixels.
; PLAN: r0=327(x), r1=149(y), r2=73(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 149
LDI r2, 73
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
