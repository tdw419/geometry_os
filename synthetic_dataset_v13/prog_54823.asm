; DESCRIPTION: Creates a yellow rectangular region at (63, 109) spanning 99 by 22 pixels.
; PLAN: r0=63(x), r1=109(y), r2=99(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 109
LDI r2, 99
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
