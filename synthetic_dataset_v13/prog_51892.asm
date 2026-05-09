; DESCRIPTION: Creates a yellow rectangular region at (20, 1) spanning 93 by 21 pixels.
; PLAN: r0=20(x), r1=1(y), r2=93(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 1
LDI r2, 93
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
