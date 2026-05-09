; DESCRIPTION: Creates a purple rectangular region at (280, 106) spanning 100 by 109 pixels.
; PLAN: r0=280(x), r1=106(y), r2=100(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 106
LDI r2, 100
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
