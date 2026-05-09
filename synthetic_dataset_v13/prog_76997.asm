; DESCRIPTION: Creates a green rectangular region at (474, 162) spanning 35 by 19 pixels.
; PLAN: r0=474(x), r1=162(y), r2=35(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 162
LDI r2, 35
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
