; DESCRIPTION: Creates a blue rectangular region at (7, 148) spanning 115 by 74 pixels.
; PLAN: r0=7(x), r1=148(y), r2=115(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 148
LDI r2, 115
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
