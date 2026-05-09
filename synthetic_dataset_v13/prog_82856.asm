; DESCRIPTION: Creates a blue rectangular region at (449, 64) spanning 26 by 48 pixels.
; PLAN: r0=449(x), r1=64(y), r2=26(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 64
LDI r2, 26
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
