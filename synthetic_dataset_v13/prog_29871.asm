; DESCRIPTION: Creates a green rectangular region at (341, 36) spanning 104 by 33 pixels.
; PLAN: r0=341(x), r1=36(y), r2=104(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 36
LDI r2, 104
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
