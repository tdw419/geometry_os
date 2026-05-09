; DESCRIPTION: Creates a blue rectangular region at (223, 134) spanning 34 by 67 pixels.
; PLAN: r0=223(x), r1=134(y), r2=34(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 134
LDI r2, 34
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
