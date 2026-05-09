; DESCRIPTION: Creates a yellow rectangular region at (6, 232) spanning 48 by 21 pixels.
; PLAN: r0=6(x), r1=232(y), r2=48(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 232
LDI r2, 48
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
