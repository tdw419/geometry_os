; DESCRIPTION: Creates a purple rectangular region at (234, 16) spanning 106 by 117 pixels.
; PLAN: r0=234(x), r1=16(y), r2=106(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 16
LDI r2, 106
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
