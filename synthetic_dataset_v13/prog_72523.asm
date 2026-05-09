; DESCRIPTION: Places a orange 17x104 rectangle at position (492, 77).
; PLAN: r0=492(x), r1=77(y), r2=17(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 77
LDI r2, 17
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
