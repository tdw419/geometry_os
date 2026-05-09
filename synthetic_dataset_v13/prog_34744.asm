; DESCRIPTION: Places a purple 36x74 rectangle at position (120, 41).
; PLAN: r0=120(x), r1=41(y), r2=36(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 41
LDI r2, 36
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
