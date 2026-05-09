; DESCRIPTION: Creates a white rectangular region at (54, 68) spanning 52 by 118 pixels.
; PLAN: r0=54(x), r1=68(y), r2=52(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 68
LDI r2, 52
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
