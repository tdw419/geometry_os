; DESCRIPTION: Creates a blue rectangular region at (205, 17) spanning 29 by 117 pixels.
; PLAN: r0=205(x), r1=17(y), r2=29(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 17
LDI r2, 29
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
