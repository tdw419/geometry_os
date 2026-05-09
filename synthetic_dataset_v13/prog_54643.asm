; DESCRIPTION: Creates a blue rectangular region at (211, 121) spanning 55 by 10 pixels.
; PLAN: r0=211(x), r1=121(y), r2=55(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 121
LDI r2, 55
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
