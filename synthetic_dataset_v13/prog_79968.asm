; DESCRIPTION: Creates a purple rectangular region at (169, 26) spanning 54 by 87 pixels.
; PLAN: r0=169(x), r1=26(y), r2=54(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 26
LDI r2, 54
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
