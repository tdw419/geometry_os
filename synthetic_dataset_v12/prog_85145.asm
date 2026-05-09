; DESCRIPTION: Creates a purple rectangular region at (371, 126) spanning 102 by 74 pixels.
; PLAN: r0=371(x), r1=126(y), r2=102(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 126
LDI r2, 102
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
