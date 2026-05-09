; DESCRIPTION: Creates a blue rectangular region at (102, 135) spanning 48 by 76 pixels.
; PLAN: r0=102(x), r1=135(y), r2=48(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 135
LDI r2, 48
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
