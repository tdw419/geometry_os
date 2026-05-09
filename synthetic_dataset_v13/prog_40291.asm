; DESCRIPTION: Creates a blue rectangular region at (252, 93) spanning 76 by 29 pixels.
; PLAN: r0=252(x), r1=93(y), r2=76(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 93
LDI r2, 76
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
