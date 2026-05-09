; DESCRIPTION: Creates a purple rectangular region at (26, 45) spanning 99 by 111 pixels.
; PLAN: r0=26(x), r1=45(y), r2=99(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 45
LDI r2, 99
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
