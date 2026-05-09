; DESCRIPTION: Creates a purple rectangular region at (279, 140) spanning 39 by 18 pixels.
; PLAN: r0=279(x), r1=140(y), r2=39(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 140
LDI r2, 39
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
