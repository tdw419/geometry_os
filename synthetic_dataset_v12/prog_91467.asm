; DESCRIPTION: Creates a yellow rectangular region at (122, 64) spanning 104 by 36 pixels.
; PLAN: r0=122(x), r1=64(y), r2=104(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 64
LDI r2, 104
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
