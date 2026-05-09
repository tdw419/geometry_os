; DESCRIPTION: Creates a white rectangular region at (340, 12) spanning 101 by 83 pixels.
; PLAN: r0=340(x), r1=12(y), r2=101(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 12
LDI r2, 101
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
