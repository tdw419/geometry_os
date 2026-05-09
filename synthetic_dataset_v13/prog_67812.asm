; DESCRIPTION: Creates a purple rectangular region at (290, 11) spanning 109 by 101 pixels.
; PLAN: r0=290(x), r1=11(y), r2=109(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 11
LDI r2, 109
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
