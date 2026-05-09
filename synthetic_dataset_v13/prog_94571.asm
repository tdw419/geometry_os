; DESCRIPTION: Creates a purple rectangular region at (259, 181) spanning 109 by 12 pixels.
; PLAN: r0=259(x), r1=181(y), r2=109(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 181
LDI r2, 109
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
