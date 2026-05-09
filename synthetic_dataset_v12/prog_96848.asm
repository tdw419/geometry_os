; DESCRIPTION: Creates a blue rectangular region at (81, 234) spanning 40 by 10 pixels.
; PLAN: r0=81(x), r1=234(y), r2=40(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 234
LDI r2, 40
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
