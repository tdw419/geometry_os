; DESCRIPTION: Creates a blue rectangular region at (109, 12) spanning 35 by 46 pixels.
; PLAN: r0=109(x), r1=12(y), r2=35(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 12
LDI r2, 35
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
