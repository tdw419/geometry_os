; DESCRIPTION: Creates a yellow rectangular region at (52, 119) spanning 28 by 20 pixels.
; PLAN: r0=52(x), r1=119(y), r2=28(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 119
LDI r2, 28
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
