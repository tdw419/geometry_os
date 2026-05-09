; DESCRIPTION: Creates a blue rectangular region at (123, 194) spanning 78 by 39 pixels.
; PLAN: r0=123(x), r1=194(y), r2=78(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 194
LDI r2, 78
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
