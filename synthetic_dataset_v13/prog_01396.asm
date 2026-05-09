; DESCRIPTION: Creates a purple rectangular region at (406, 69) spanning 32 by 32 pixels.
; PLAN: r0=406(x), r1=69(y), r2=32(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 69
LDI r2, 32
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
