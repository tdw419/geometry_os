; DESCRIPTION: Creates a blue rectangular region at (49, 94) spanning 65 by 63 pixels.
; PLAN: r0=49(x), r1=94(y), r2=65(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 94
LDI r2, 65
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
