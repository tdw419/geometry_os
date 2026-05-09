; DESCRIPTION: Creates a blue rectangular region at (32, 15) spanning 112 by 87 pixels.
; PLAN: r0=32(x), r1=15(y), r2=112(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 15
LDI r2, 112
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
