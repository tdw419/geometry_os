; DESCRIPTION: Creates a blue rectangular region at (484, 193) spanning 26 by 27 pixels.
; PLAN: r0=484(x), r1=193(y), r2=26(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 193
LDI r2, 26
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
