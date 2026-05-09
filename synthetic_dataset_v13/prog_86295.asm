; DESCRIPTION: Creates a blue rectangular region at (295, 11) spanning 107 by 97 pixels.
; PLAN: r0=295(x), r1=11(y), r2=107(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 11
LDI r2, 107
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
