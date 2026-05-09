; DESCRIPTION: Creates a blue rectangular region at (309, 63) spanning 50 by 94 pixels.
; PLAN: r0=309(x), r1=63(y), r2=50(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 63
LDI r2, 50
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
