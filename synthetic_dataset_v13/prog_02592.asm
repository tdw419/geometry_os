; DESCRIPTION: Creates a blue rectangular region at (87, 126) spanning 71 by 49 pixels.
; PLAN: r0=87(x), r1=126(y), r2=71(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 126
LDI r2, 71
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
