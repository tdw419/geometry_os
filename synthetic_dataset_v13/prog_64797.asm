; DESCRIPTION: Creates a white rectangular region at (398, 121) spanning 38 by 114 pixels.
; PLAN: r0=398(x), r1=121(y), r2=38(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 121
LDI r2, 38
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
