; DESCRIPTION: Creates a blue rectangular region at (29, 131) spanning 23 by 46 pixels.
; PLAN: r0=29(x), r1=131(y), r2=23(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 131
LDI r2, 23
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
