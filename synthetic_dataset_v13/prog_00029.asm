; DESCRIPTION: Places a orange 26x12 rectangle at position (164, 104).
; PLAN: r0=164(x), r1=104(y), r2=26(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 104
LDI r2, 26
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
