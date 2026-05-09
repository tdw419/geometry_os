; DESCRIPTION: Creates a red rectangular region at (56, 104) spanning 20 by 110 pixels.
; PLAN: r0=56(x), r1=104(y), r2=20(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 104
LDI r2, 20
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
