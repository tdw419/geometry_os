; DESCRIPTION: Creates a blue rectangular region at (149, 67) spanning 44 by 18 pixels.
; PLAN: r0=149(x), r1=67(y), r2=44(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 67
LDI r2, 44
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
