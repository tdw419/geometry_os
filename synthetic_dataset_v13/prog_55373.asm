; DESCRIPTION: Creates a purple rectangular region at (179, 46) spanning 13 by 21 pixels.
; PLAN: r0=179(x), r1=46(y), r2=13(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 46
LDI r2, 13
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
