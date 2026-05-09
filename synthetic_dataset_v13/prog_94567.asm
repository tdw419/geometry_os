; DESCRIPTION: Creates a white rectangular region at (271, 136) spanning 104 by 24 pixels.
; PLAN: r0=271(x), r1=136(y), r2=104(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 136
LDI r2, 104
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
