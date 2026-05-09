; DESCRIPTION: Creates a black rectangular region at (377, 196) spanning 118 by 19 pixels.
; PLAN: r0=377(x), r1=196(y), r2=118(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 196
LDI r2, 118
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
