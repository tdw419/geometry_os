; DESCRIPTION: Creates a white rectangular region at (21, 227) spanning 90 by 15 pixels.
; PLAN: r0=21(x), r1=227(y), r2=90(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 227
LDI r2, 90
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
