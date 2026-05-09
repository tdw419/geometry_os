; DESCRIPTION: Creates a yellow rectangular region at (30, 49) spanning 60 by 61 pixels.
; PLAN: r0=30(x), r1=49(y), r2=60(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 49
LDI r2, 60
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
