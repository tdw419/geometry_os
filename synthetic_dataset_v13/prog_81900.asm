; DESCRIPTION: Creates a yellow rectangular region at (329, 130) spanning 89 by 97 pixels.
; PLAN: r0=329(x), r1=130(y), r2=89(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 130
LDI r2, 89
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
