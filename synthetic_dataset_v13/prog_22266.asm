; DESCRIPTION: Creates a white rectangular region at (380, 1) spanning 35 by 12 pixels.
; PLAN: r0=380(x), r1=1(y), r2=35(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 1
LDI r2, 35
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
