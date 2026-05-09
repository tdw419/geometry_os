; DESCRIPTION: Creates a yellow rectangular region at (10, 17) spanning 21 by 64 pixels.
; PLAN: r0=10(x), r1=17(y), r2=21(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 17
LDI r2, 21
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
