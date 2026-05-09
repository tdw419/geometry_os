; DESCRIPTION: Creates a white rectangular region at (226, 104) spanning 18 by 38 pixels.
; PLAN: r0=226(x), r1=104(y), r2=18(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 104
LDI r2, 18
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
