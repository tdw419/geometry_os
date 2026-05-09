; DESCRIPTION: Creates a white rectangular region at (101, 83) spanning 27 by 110 pixels.
; PLAN: r0=101(x), r1=83(y), r2=27(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 83
LDI r2, 27
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
