; DESCRIPTION: Creates a blue rectangular region at (145, 35) spanning 97 by 42 pixels.
; PLAN: r0=145(x), r1=35(y), r2=97(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 35
LDI r2, 97
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
