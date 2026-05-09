; DESCRIPTION: Creates a yellow rectangular region at (173, 162) spanning 34 by 37 pixels.
; PLAN: r0=173(x), r1=162(y), r2=34(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 162
LDI r2, 34
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
