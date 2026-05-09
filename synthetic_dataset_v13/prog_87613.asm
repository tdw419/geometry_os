; DESCRIPTION: Creates a white rectangular region at (188, 81) spanning 104 by 84 pixels.
; PLAN: r0=188(x), r1=81(y), r2=104(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 81
LDI r2, 104
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
