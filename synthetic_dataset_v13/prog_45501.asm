; DESCRIPTION: Places a orange 15x103 rectangle at position (169, 53).
; PLAN: r0=169(x), r1=53(y), r2=15(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 53
LDI r2, 15
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
