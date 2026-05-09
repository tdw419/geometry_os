; DESCRIPTION: Creates a purple rectangular region at (35, 140) spanning 91 by 103 pixels.
; PLAN: r0=35(x), r1=140(y), r2=91(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 140
LDI r2, 91
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
