; DESCRIPTION: Creates a green rectangular region at (291, 154) spanning 18 by 56 pixels.
; PLAN: r0=291(x), r1=154(y), r2=18(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 154
LDI r2, 18
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
