; DESCRIPTION: Creates a blue rectangular region at (257, 142) spanning 95 by 81 pixels.
; PLAN: r0=257(x), r1=142(y), r2=95(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 142
LDI r2, 95
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
