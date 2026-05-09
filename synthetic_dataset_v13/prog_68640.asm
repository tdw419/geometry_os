; DESCRIPTION: Creates a yellow rectangular region at (418, 5) spanning 61 by 88 pixels.
; PLAN: r0=418(x), r1=5(y), r2=61(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 5
LDI r2, 61
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
