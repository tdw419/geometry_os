; DESCRIPTION: Creates a blue rectangular region at (256, 100) spanning 87 by 27 pixels.
; PLAN: r0=256(x), r1=100(y), r2=87(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 100
LDI r2, 87
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
