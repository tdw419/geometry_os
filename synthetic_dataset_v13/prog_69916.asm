; DESCRIPTION: Places a orange 77x21 rectangle at position (248, 77).
; PLAN: r0=248(x), r1=77(y), r2=77(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 77
LDI r2, 77
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
