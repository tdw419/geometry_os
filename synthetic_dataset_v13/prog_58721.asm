; DESCRIPTION: Creates a cyan rectangular region at (35, 63) spanning 96 by 118 pixels.
; PLAN: r0=35(x), r1=63(y), r2=96(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 63
LDI r2, 96
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
