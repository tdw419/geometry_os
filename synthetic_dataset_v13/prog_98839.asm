; DESCRIPTION: Creates a blue rectangular region at (32, 101) spanning 17 by 98 pixels.
; PLAN: r0=32(x), r1=101(y), r2=17(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 101
LDI r2, 17
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
