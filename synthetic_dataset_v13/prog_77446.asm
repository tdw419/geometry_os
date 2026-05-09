; DESCRIPTION: Places a red 26x95 rectangle at position (156, 123).
; PLAN: r0=156(x), r1=123(y), r2=26(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 123
LDI r2, 26
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
