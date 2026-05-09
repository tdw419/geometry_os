; DESCRIPTION: Places a red 12x74 rectangle at position (67, 50).
; PLAN: r0=67(x), r1=50(y), r2=12(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 50
LDI r2, 12
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
