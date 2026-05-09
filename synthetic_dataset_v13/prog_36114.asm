; DESCRIPTION: Creates a purple rectangular region at (169, 94) spanning 66 by 27 pixels.
; PLAN: r0=169(x), r1=94(y), r2=66(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 94
LDI r2, 66
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
