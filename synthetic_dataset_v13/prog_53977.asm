; DESCRIPTION: Creates a blue rectangular region at (339, 152) spanning 115 by 99 pixels.
; PLAN: r0=339(x), r1=152(y), r2=115(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 152
LDI r2, 115
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
