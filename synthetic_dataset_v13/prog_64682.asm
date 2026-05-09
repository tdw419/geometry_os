; DESCRIPTION: Creates a red rectangular region at (192, 75) spanning 22 by 72 pixels.
; PLAN: r0=192(x), r1=75(y), r2=22(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 75
LDI r2, 22
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
