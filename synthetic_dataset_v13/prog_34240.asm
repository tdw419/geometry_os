; DESCRIPTION: Creates a purple rectangular region at (402, 58) spanning 93 by 67 pixels.
; PLAN: r0=402(x), r1=58(y), r2=93(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 58
LDI r2, 93
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
