; DESCRIPTION: Creates a blue rectangular region at (289, 180) spanning 62 by 42 pixels.
; PLAN: r0=289(x), r1=180(y), r2=62(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 180
LDI r2, 62
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
