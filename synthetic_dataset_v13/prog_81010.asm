; DESCRIPTION: Creates a green rectangular region at (457, 109) spanning 16 by 88 pixels.
; PLAN: r0=457(x), r1=109(y), r2=16(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 109
LDI r2, 16
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
