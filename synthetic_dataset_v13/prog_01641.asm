; DESCRIPTION: Creates a purple rectangular region at (393, 14) spanning 103 by 22 pixels.
; PLAN: r0=393(x), r1=14(y), r2=103(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 14
LDI r2, 103
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
