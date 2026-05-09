; DESCRIPTION: Places a black 113x74 rectangle at position (30, 85).
; PLAN: r0=30(x), r1=85(y), r2=113(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 85
LDI r2, 113
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
