; DESCRIPTION: Creates a orange rectangular region at (179, 62) spanning 48 by 112 pixels.
; PLAN: r0=179(x), r1=62(y), r2=48(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 62
LDI r2, 48
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
