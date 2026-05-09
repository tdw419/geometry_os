; DESCRIPTION: Creates a blue rectangular region at (121, 34) spanning 15 by 48 pixels.
; PLAN: r0=121(x), r1=34(y), r2=15(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 34
LDI r2, 15
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
