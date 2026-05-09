; DESCRIPTION: Creates a purple rectangular region at (63, 109) spanning 76 by 52 pixels.
; PLAN: r0=63(x), r1=109(y), r2=76(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 109
LDI r2, 76
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
