; DESCRIPTION: Creates a blue rectangular region at (6, 114) spanning 45 by 69 pixels.
; PLAN: r0=6(x), r1=114(y), r2=45(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 114
LDI r2, 45
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
