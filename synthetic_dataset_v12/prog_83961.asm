; DESCRIPTION: Places a white 100x117 rectangle at position (364, 108).
; PLAN: r0=364(x), r1=108(y), r2=100(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 108
LDI r2, 100
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
