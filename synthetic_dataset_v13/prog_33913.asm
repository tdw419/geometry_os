; DESCRIPTION: Creates a blue rectangular region at (107, 93) spanning 22 by 108 pixels.
; PLAN: r0=107(x), r1=93(y), r2=22(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 93
LDI r2, 22
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
