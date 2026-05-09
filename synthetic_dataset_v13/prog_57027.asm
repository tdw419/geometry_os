; DESCRIPTION: Creates a yellow rectangular region at (211, 95) spanning 10 by 35 pixels.
; PLAN: r0=211(x), r1=95(y), r2=10(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 95
LDI r2, 10
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
