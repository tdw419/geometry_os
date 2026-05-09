; DESCRIPTION: Creates a yellow rectangular region at (162, 96) spanning 75 by 38 pixels.
; PLAN: r0=162(x), r1=96(y), r2=75(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 96
LDI r2, 75
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
