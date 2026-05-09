; DESCRIPTION: Creates a blue rectangular region at (159, 138) spanning 92 by 48 pixels.
; PLAN: r0=159(x), r1=138(y), r2=92(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 92
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
