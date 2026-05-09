; DESCRIPTION: Creates a purple rectangular region at (376, 70) spanning 20 by 37 pixels.
; PLAN: r0=376(x), r1=70(y), r2=20(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 70
LDI r2, 20
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
