; DESCRIPTION: Creates a red rectangular region at (88, 94) spanning 48 by 66 pixels.
; PLAN: r0=88(x), r1=94(y), r2=48(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 94
LDI r2, 48
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
