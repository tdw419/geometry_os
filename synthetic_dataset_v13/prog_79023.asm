; DESCRIPTION: Creates a purple rectangular region at (259, 95) spanning 34 by 95 pixels.
; PLAN: r0=259(x), r1=95(y), r2=34(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 95
LDI r2, 34
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
