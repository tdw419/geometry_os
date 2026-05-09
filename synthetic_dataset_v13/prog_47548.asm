; DESCRIPTION: Creates a purple rectangular region at (376, 16) spanning 80 by 63 pixels.
; PLAN: r0=376(x), r1=16(y), r2=80(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 16
LDI r2, 80
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
