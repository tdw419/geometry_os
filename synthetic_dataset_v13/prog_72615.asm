; DESCRIPTION: Places a red 54x35 rectangle at position (162, 141).
; PLAN: r0=162(x), r1=141(y), r2=54(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 141
LDI r2, 54
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
