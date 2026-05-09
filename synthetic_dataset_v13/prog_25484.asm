; DESCRIPTION: Creates a blue rectangular region at (126, 143) spanning 52 by 31 pixels.
; PLAN: r0=126(x), r1=143(y), r2=52(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 143
LDI r2, 52
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
