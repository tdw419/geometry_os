; DESCRIPTION: Creates a white rectangular region at (315, 81) spanning 35 by 23 pixels.
; PLAN: r0=315(x), r1=81(y), r2=35(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 81
LDI r2, 35
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
