; DESCRIPTION: Creates a green rectangular region at (143, 89) spanning 104 by 56 pixels.
; PLAN: r0=143(x), r1=89(y), r2=104(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 89
LDI r2, 104
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
