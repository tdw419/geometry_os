; DESCRIPTION: Places a red 74x74 rectangle at position (19, 106).
; PLAN: r0=19(x), r1=106(y), r2=74(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 106
LDI r2, 74
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
