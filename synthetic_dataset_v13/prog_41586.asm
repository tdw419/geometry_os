; DESCRIPTION: Creates a white rectangular region at (77, 124) spanning 104 by 68 pixels.
; PLAN: r0=77(x), r1=124(y), r2=104(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 124
LDI r2, 104
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
