; DESCRIPTION: Creates a blue rectangular region at (102, 29) spanning 12 by 48 pixels.
; PLAN: r0=102(x), r1=29(y), r2=12(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 29
LDI r2, 12
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
