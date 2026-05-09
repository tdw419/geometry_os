; DESCRIPTION: Creates a yellow rectangular region at (339, 95) spanning 16 by 61 pixels.
; PLAN: r0=339(x), r1=95(y), r2=16(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 95
LDI r2, 16
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
