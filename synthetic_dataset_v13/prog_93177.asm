; DESCRIPTION: Creates a purple rectangular region at (345, 46) spanning 14 by 90 pixels.
; PLAN: r0=345(x), r1=46(y), r2=14(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 46
LDI r2, 14
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
