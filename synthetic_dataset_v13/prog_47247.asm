; DESCRIPTION: Creates a yellow rectangular region at (10, 172) spanning 16 by 34 pixels.
; PLAN: r0=10(x), r1=172(y), r2=16(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 172
LDI r2, 16
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
