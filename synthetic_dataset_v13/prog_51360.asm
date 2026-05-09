; DESCRIPTION: Creates a blue rectangular region at (56, 146) spanning 12 by 97 pixels.
; PLAN: r0=56(x), r1=146(y), r2=12(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 146
LDI r2, 12
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
