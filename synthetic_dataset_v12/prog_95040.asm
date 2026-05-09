; DESCRIPTION: Creates a blue rectangular region at (355, 126) spanning 40 by 63 pixels.
; PLAN: r0=355(x), r1=126(y), r2=40(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 126
LDI r2, 40
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
