; DESCRIPTION: Creates a blue rectangular region at (73, 43) spanning 18 by 12 pixels.
; PLAN: r0=73(x), r1=43(y), r2=18(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 43
LDI r2, 18
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
