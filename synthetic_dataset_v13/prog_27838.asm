; DESCRIPTION: Creates a white rectangular region at (129, 104) spanning 88 by 113 pixels.
; PLAN: r0=129(x), r1=104(y), r2=88(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 104
LDI r2, 88
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
