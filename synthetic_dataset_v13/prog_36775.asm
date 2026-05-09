; DESCRIPTION: Creates a yellow rectangular region at (86, 10) spanning 81 by 95 pixels.
; PLAN: r0=86(x), r1=10(y), r2=81(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 10
LDI r2, 81
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
