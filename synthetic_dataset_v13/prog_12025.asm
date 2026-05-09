; DESCRIPTION: Creates a yellow rectangular region at (89, 21) spanning 30 by 93 pixels.
; PLAN: r0=89(x), r1=21(y), r2=30(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 21
LDI r2, 30
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
