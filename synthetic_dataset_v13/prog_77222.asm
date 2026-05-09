; DESCRIPTION: Creates a white rectangular region at (386, 101) spanning 38 by 83 pixels.
; PLAN: r0=386(x), r1=101(y), r2=38(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 101
LDI r2, 38
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
