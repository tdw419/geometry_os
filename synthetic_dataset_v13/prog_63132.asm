; DESCRIPTION: Places a orange 100x35 rectangle at position (235, 53).
; PLAN: r0=235(x), r1=53(y), r2=100(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 53
LDI r2, 100
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
