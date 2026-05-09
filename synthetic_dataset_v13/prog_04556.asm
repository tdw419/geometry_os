; DESCRIPTION: Creates a blue rectangular region at (166, 179) spanning 69 by 24 pixels.
; PLAN: r0=166(x), r1=179(y), r2=69(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 179
LDI r2, 69
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
