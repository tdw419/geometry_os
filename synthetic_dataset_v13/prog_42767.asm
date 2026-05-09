; DESCRIPTION: Places a orange 71x40 rectangle at position (312, 104).
; PLAN: r0=312(x), r1=104(y), r2=71(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 104
LDI r2, 71
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
