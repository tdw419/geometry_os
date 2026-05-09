; DESCRIPTION: Places a yellow 85x89 rectangle at position (104, 67).
; PLAN: r0=104(x), r1=67(y), r2=85(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 67
LDI r2, 85
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
