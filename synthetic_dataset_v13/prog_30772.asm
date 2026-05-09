; DESCRIPTION: Creates a blue rectangular region at (196, 105) spanning 117 by 101 pixels.
; PLAN: r0=196(x), r1=105(y), r2=117(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 105
LDI r2, 117
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
