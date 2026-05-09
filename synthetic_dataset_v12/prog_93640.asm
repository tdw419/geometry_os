; DESCRIPTION: Creates a blue rectangular region at (127, 61) spanning 97 by 68 pixels.
; PLAN: r0=127(x), r1=61(y), r2=97(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 61
LDI r2, 97
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
