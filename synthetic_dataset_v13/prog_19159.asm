; DESCRIPTION: Places a yellow 67x85 rectangle at position (47, 37).
; PLAN: r0=47(x), r1=37(y), r2=67(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 37
LDI r2, 67
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
