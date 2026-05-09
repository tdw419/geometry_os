; DESCRIPTION: Creates a blue rectangular region at (100, 73) spanning 26 by 55 pixels.
; PLAN: r0=100(x), r1=73(y), r2=26(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 73
LDI r2, 26
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
