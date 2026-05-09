; DESCRIPTION: Creates a blue rectangular region at (86, 56) spanning 95 by 85 pixels.
; PLAN: r0=86(x), r1=56(y), r2=95(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 56
LDI r2, 95
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
