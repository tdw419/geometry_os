; DESCRIPTION: Places a red 47x62 rectangle at position (411, 27).
; PLAN: r0=411(x), r1=27(y), r2=47(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 27
LDI r2, 47
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
