; DESCRIPTION: Creates a white rectangular region at (400, 199) spanning 75 by 22 pixels.
; PLAN: r0=400(x), r1=199(y), r2=75(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 199
LDI r2, 75
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
