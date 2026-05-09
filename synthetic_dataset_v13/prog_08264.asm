; DESCRIPTION: Creates a purple rectangular region at (382, 72) spanning 90 by 63 pixels.
; PLAN: r0=382(x), r1=72(y), r2=90(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 72
LDI r2, 90
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
