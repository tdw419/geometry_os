; DESCRIPTION: Creates a blue rectangular region at (96, 65) spanning 117 by 24 pixels.
; PLAN: r0=96(x), r1=65(y), r2=117(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 65
LDI r2, 117
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
