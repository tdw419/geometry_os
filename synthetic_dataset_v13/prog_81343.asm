; DESCRIPTION: Creates a white rectangular region at (176, 22) spanning 90 by 52 pixels.
; PLAN: r0=176(x), r1=22(y), r2=90(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 22
LDI r2, 90
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
