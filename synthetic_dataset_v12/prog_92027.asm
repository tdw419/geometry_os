; DESCRIPTION: Creates a green rectangular region at (124, 183) spanning 104 by 21 pixels.
; PLAN: r0=124(x), r1=183(y), r2=104(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 183
LDI r2, 104
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
