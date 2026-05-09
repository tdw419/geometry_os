; DESCRIPTION: Creates a purple rectangular region at (35, 173) spanning 28 by 23 pixels.
; PLAN: r0=35(x), r1=173(y), r2=28(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 173
LDI r2, 28
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
