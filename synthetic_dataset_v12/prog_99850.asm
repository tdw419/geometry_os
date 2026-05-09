; DESCRIPTION: Creates a purple rectangular region at (233, 154) spanning 99 by 44 pixels.
; PLAN: r0=233(x), r1=154(y), r2=99(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 154
LDI r2, 99
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
