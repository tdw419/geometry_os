; DESCRIPTION: Creates a blue rectangular region at (46, 18) spanning 69 by 90 pixels.
; PLAN: r0=46(x), r1=18(y), r2=69(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 18
LDI r2, 69
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
