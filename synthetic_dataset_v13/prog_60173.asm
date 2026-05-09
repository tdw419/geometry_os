; DESCRIPTION: Creates a blue rectangular region at (278, 179) spanning 81 by 45 pixels.
; PLAN: r0=278(x), r1=179(y), r2=81(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 179
LDI r2, 81
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
