; DESCRIPTION: Creates a purple rectangular region at (326, 27) spanning 39 by 110 pixels.
; PLAN: r0=326(x), r1=27(y), r2=39(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 27
LDI r2, 39
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
