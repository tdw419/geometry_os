; DESCRIPTION: Creates a purple rectangular region at (269, 135) spanning 58 by 111 pixels.
; PLAN: r0=269(x), r1=135(y), r2=58(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 135
LDI r2, 58
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
