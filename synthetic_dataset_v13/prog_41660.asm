; DESCRIPTION: Creates a purple rectangular region at (120, 126) spanning 19 by 24 pixels.
; PLAN: r0=120(x), r1=126(y), r2=19(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 126
LDI r2, 19
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
