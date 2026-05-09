; DESCRIPTION: Creates a white rectangular region at (435, 140) spanning 61 by 22 pixels.
; PLAN: r0=435(x), r1=140(y), r2=61(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 140
LDI r2, 61
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
