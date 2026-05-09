; DESCRIPTION: Creates a blue rectangular region at (86, 29) spanning 81 by 45 pixels.
; PLAN: r0=86(x), r1=29(y), r2=81(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 29
LDI r2, 81
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
