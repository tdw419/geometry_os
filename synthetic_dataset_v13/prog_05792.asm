; DESCRIPTION: Creates a blue rectangular region at (68, 10) spanning 43 by 22 pixels.
; PLAN: r0=68(x), r1=10(y), r2=43(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 10
LDI r2, 43
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
