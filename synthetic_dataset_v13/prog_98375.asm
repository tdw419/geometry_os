; DESCRIPTION: Creates a blue rectangular region at (174, 76) spanning 48 by 89 pixels.
; PLAN: r0=174(x), r1=76(y), r2=48(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 76
LDI r2, 48
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
