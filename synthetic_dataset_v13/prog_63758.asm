; DESCRIPTION: Creates a yellow rectangular region at (208, 222) spanning 31 by 30 pixels.
; PLAN: r0=208(x), r1=222(y), r2=31(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 222
LDI r2, 31
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
