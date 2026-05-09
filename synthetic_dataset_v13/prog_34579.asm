; DESCRIPTION: Creates a yellow rectangular region at (377, 184) spanning 28 by 15 pixels.
; PLAN: r0=377(x), r1=184(y), r2=28(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 184
LDI r2, 28
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
