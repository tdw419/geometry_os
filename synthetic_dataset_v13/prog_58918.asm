; DESCRIPTION: Places a red 25x53 rectangle at position (220, 158).
; PLAN: r0=220(x), r1=158(y), r2=25(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 158
LDI r2, 25
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
