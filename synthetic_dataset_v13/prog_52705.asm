; DESCRIPTION: Creates a blue rectangular region at (434, 37) spanning 76 by 97 pixels.
; PLAN: r0=434(x), r1=37(y), r2=76(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 37
LDI r2, 76
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
