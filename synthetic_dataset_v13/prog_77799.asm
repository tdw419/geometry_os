; DESCRIPTION: Creates a blue rectangular region at (452, 87) spanning 25 by 30 pixels.
; PLAN: r0=452(x), r1=87(y), r2=25(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 87
LDI r2, 25
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
