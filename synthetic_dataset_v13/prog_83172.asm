; DESCRIPTION: Creates a yellow rectangular region at (60, 158) spanning 30 by 86 pixels.
; PLAN: r0=60(x), r1=158(y), r2=30(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 158
LDI r2, 30
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
