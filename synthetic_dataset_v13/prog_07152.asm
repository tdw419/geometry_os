; DESCRIPTION: Creates a blue rectangular region at (233, 18) spanning 114 by 71 pixels.
; PLAN: r0=233(x), r1=18(y), r2=114(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 18
LDI r2, 114
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
