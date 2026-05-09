; DESCRIPTION: Creates a purple rectangular region at (402, 12) spanning 80 by 29 pixels.
; PLAN: r0=402(x), r1=12(y), r2=80(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 12
LDI r2, 80
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
