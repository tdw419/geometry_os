; DESCRIPTION: Creates a blue rectangular region at (223, 81) spanning 11 by 10 pixels.
; PLAN: r0=223(x), r1=81(y), r2=11(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 81
LDI r2, 11
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
