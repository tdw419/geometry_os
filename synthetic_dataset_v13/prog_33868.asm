; DESCRIPTION: Places a red 10x106 rectangle at position (176, 106).
; PLAN: r0=176(x), r1=106(y), r2=10(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 106
LDI r2, 10
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
