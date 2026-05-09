; DESCRIPTION: Creates a yellow rectangular region at (338, 17) spanning 48 by 28 pixels.
; PLAN: r0=338(x), r1=17(y), r2=48(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 17
LDI r2, 48
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
