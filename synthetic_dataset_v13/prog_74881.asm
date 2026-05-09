; DESCRIPTION: Places a red 26x119 rectangle at position (55, 83).
; PLAN: r0=55(x), r1=83(y), r2=26(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 83
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
