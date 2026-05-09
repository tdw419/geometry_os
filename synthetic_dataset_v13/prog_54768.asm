; DESCRIPTION: Creates a yellow rectangular region at (265, 18) spanning 112 by 20 pixels.
; PLAN: r0=265(x), r1=18(y), r2=112(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 18
LDI r2, 112
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
