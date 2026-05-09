; DESCRIPTION: Creates a purple rectangular region at (8, 166) spanning 111 by 31 pixels.
; PLAN: r0=8(x), r1=166(y), r2=111(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 166
LDI r2, 111
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
