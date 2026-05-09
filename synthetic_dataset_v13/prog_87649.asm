; DESCRIPTION: Creates a purple rectangular region at (406, 86) spanning 52 by 47 pixels.
; PLAN: r0=406(x), r1=86(y), r2=52(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 86
LDI r2, 52
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
