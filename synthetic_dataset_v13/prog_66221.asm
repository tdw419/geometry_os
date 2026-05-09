; DESCRIPTION: Creates a blue rectangular region at (184, 155) spanning 80 by 42 pixels.
; PLAN: r0=184(x), r1=155(y), r2=80(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 155
LDI r2, 80
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
