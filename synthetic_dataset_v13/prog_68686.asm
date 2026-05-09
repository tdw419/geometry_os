; DESCRIPTION: Creates a yellow rectangular region at (225, 119) spanning 14 by 93 pixels.
; PLAN: r0=225(x), r1=119(y), r2=14(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 119
LDI r2, 14
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
