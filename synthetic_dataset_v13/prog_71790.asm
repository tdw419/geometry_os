; DESCRIPTION: Places a red 66x49 rectangle at position (74, 113).
; PLAN: r0=74(x), r1=113(y), r2=66(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 113
LDI r2, 66
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
