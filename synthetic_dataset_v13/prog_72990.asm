; DESCRIPTION: Places a white 85x36 rectangle at position (102, 88).
; PLAN: r0=102(x), r1=88(y), r2=85(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 88
LDI r2, 85
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
