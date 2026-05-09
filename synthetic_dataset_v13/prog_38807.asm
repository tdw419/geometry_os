; DESCRIPTION: Creates a white rectangular region at (288, 165) spanning 104 by 26 pixels.
; PLAN: r0=288(x), r1=165(y), r2=104(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 165
LDI r2, 104
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
