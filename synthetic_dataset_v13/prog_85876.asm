; DESCRIPTION: Creates a blue rectangular region at (189, 19) spanning 59 by 96 pixels.
; PLAN: r0=189(x), r1=19(y), r2=59(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 19
LDI r2, 59
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
