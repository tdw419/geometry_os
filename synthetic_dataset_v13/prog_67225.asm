; DESCRIPTION: Creates a white rectangular region at (260, 36) spanning 104 by 114 pixels.
; PLAN: r0=260(x), r1=36(y), r2=104(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 36
LDI r2, 104
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
