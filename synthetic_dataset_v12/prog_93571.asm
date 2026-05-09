; DESCRIPTION: Creates a purple rectangular region at (16, 206) spanning 112 by 23 pixels.
; PLAN: r0=16(x), r1=206(y), r2=112(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 206
LDI r2, 112
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
