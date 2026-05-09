; DESCRIPTION: Creates a yellow rectangular region at (101, 93) spanning 106 by 48 pixels.
; PLAN: r0=101(x), r1=93(y), r2=106(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 93
LDI r2, 106
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
