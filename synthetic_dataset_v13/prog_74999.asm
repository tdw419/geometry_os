; DESCRIPTION: Creates a yellow rectangular region at (259, 75) spanning 73 by 103 pixels.
; PLAN: r0=259(x), r1=75(y), r2=73(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 75
LDI r2, 73
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
