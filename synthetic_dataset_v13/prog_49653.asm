; DESCRIPTION: Creates a purple rectangular region at (259, 164) spanning 54 by 68 pixels.
; PLAN: r0=259(x), r1=164(y), r2=54(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 164
LDI r2, 54
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
