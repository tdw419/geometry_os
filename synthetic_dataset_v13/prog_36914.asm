; DESCRIPTION: Creates a blue rectangular region at (179, 116) spanning 107 by 49 pixels.
; PLAN: r0=179(x), r1=116(y), r2=107(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 116
LDI r2, 107
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
