; DESCRIPTION: Creates a blue rectangular region at (27, 176) spanning 119 by 14 pixels.
; PLAN: r0=27(x), r1=176(y), r2=119(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 176
LDI r2, 119
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
