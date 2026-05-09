; DESCRIPTION: Creates a yellow rectangular region at (3, 23) spanning 115 by 93 pixels.
; PLAN: r0=3(x), r1=23(y), r2=115(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 23
LDI r2, 115
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
