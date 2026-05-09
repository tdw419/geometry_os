; DESCRIPTION: Creates a red rectangular region at (109, 21) spanning 101 by 22 pixels.
; PLAN: r0=109(x), r1=21(y), r2=101(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 21
LDI r2, 101
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
