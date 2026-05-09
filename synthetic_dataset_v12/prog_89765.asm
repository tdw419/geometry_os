; DESCRIPTION: Creates a purple rectangular region at (433, 133) spanning 13 by 117 pixels.
; PLAN: r0=433(x), r1=133(y), r2=13(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 133
LDI r2, 13
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
