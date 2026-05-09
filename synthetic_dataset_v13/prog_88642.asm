; DESCRIPTION: Creates a purple rectangular region at (56, 194) spanning 52 by 18 pixels.
; PLAN: r0=56(x), r1=194(y), r2=52(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 194
LDI r2, 52
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
