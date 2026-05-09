; DESCRIPTION: Creates a purple rectangular region at (148, 103) spanning 54 by 114 pixels.
; PLAN: r0=148(x), r1=103(y), r2=54(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 103
LDI r2, 54
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
