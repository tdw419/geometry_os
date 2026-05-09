; DESCRIPTION: Creates a purple rectangular region at (125, 28) spanning 105 by 99 pixels.
; PLAN: r0=125(x), r1=28(y), r2=105(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 28
LDI r2, 105
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
