; DESCRIPTION: Creates a blue rectangular region at (210, 109) spanning 63 by 119 pixels.
; PLAN: r0=210(x), r1=109(y), r2=63(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 109
LDI r2, 63
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
