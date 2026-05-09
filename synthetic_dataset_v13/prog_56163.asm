; DESCRIPTION: Places a red 88x95 rectangle at position (165, 45).
; PLAN: r0=165(x), r1=45(y), r2=88(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 45
LDI r2, 88
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
