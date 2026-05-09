; DESCRIPTION: Creates a red rectangular region at (253, 110) spanning 80 by 75 pixels.
; PLAN: r0=253(x), r1=110(y), r2=80(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 110
LDI r2, 80
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
