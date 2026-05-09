; DESCRIPTION: Creates a green rectangular region at (253, 179) spanning 118 by 28 pixels.
; PLAN: r0=253(x), r1=179(y), r2=118(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 179
LDI r2, 118
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
