; DESCRIPTION: Creates a purple rectangular region at (382, 95) spanning 91 by 72 pixels.
; PLAN: r0=382(x), r1=95(y), r2=91(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 95
LDI r2, 91
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
