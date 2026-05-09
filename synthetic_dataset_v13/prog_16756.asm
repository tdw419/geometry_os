; DESCRIPTION: Creates a purple rectangular region at (253, 101) spanning 59 by 16 pixels.
; PLAN: r0=253(x), r1=101(y), r2=59(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 101
LDI r2, 59
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
