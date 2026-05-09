; DESCRIPTION: Creates a blue rectangular region at (3, 33) spanning 72 by 39 pixels.
; PLAN: r0=3(x), r1=33(y), r2=72(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 33
LDI r2, 72
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
