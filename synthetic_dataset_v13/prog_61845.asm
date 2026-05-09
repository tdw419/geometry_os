; DESCRIPTION: Creates a yellow rectangular region at (342, 144) spanning 93 by 58 pixels.
; PLAN: r0=342(x), r1=144(y), r2=93(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 144
LDI r2, 93
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
