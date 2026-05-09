; DESCRIPTION: Creates a yellow rectangular region at (178, 80) spanning 89 by 61 pixels.
; PLAN: r0=178(x), r1=80(y), r2=89(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 80
LDI r2, 89
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
