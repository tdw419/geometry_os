; DESCRIPTION: Creates a yellow rectangular region at (450, 31) spanning 17 by 53 pixels.
; PLAN: r0=450(x), r1=31(y), r2=17(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 31
LDI r2, 17
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
