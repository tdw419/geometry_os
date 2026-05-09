; DESCRIPTION: Creates a blue rectangular region at (339, 126) spanning 45 by 99 pixels.
; PLAN: r0=339(x), r1=126(y), r2=45(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 126
LDI r2, 45
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
