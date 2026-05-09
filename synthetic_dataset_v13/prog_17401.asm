; DESCRIPTION: Creates a blue rectangular region at (28, 210) spanning 106 by 39 pixels.
; PLAN: r0=28(x), r1=210(y), r2=106(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 210
LDI r2, 106
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
