; DESCRIPTION: Creates a blue rectangular region at (184, 125) spanning 55 by 63 pixels.
; PLAN: r0=184(x), r1=125(y), r2=55(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 125
LDI r2, 55
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
