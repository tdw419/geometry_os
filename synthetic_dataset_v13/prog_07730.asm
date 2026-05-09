; DESCRIPTION: Creates a yellow rectangular region at (99, 96) spanning 76 by 109 pixels.
; PLAN: r0=99(x), r1=96(y), r2=76(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 96
LDI r2, 76
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
