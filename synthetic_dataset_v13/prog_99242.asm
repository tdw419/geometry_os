; DESCRIPTION: Places a red 118x74 rectangle at position (287, 140).
; PLAN: r0=287(x), r1=140(y), r2=118(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 140
LDI r2, 118
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
