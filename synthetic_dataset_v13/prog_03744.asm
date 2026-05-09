; DESCRIPTION: Creates a purple rectangular region at (421, 6) spanning 24 by 16 pixels.
; PLAN: r0=421(x), r1=6(y), r2=24(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 6
LDI r2, 24
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
