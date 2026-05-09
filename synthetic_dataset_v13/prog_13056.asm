; DESCRIPTION: Creates a purple rectangular region at (354, 6) spanning 88 by 61 pixels.
; PLAN: r0=354(x), r1=6(y), r2=88(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 6
LDI r2, 88
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
