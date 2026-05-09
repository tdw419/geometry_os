; DESCRIPTION: Places a red 68x53 rectangle at position (370, 158).
; PLAN: r0=370(x), r1=158(y), r2=68(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 158
LDI r2, 68
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
