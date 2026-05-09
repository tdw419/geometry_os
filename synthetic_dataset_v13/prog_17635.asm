; DESCRIPTION: Creates a green rectangular region at (245, 10) spanning 73 by 19 pixels.
; PLAN: r0=245(x), r1=10(y), r2=73(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 10
LDI r2, 73
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
