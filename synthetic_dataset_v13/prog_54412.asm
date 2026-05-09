; DESCRIPTION: Creates a yellow rectangular region at (413, 86) spanning 33 by 104 pixels.
; PLAN: r0=413(x), r1=86(y), r2=33(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 86
LDI r2, 33
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
