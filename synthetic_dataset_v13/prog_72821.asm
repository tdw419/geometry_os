; DESCRIPTION: Creates a yellow rectangular region at (336, 104) spanning 61 by 40 pixels.
; PLAN: r0=336(x), r1=104(y), r2=61(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 104
LDI r2, 61
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
