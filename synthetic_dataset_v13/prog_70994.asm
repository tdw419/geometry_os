; DESCRIPTION: Creates a white rectangular region at (351, 210) spanning 104 by 16 pixels.
; PLAN: r0=351(x), r1=210(y), r2=104(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 210
LDI r2, 104
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
