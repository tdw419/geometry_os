; DESCRIPTION: Creates a white rectangular region at (375, 153) spanning 83 by 18 pixels.
; PLAN: r0=375(x), r1=153(y), r2=83(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 153
LDI r2, 83
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
