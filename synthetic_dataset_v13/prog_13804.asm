; DESCRIPTION: Places a red 88x108 rectangle at position (187, 105).
; PLAN: r0=187(x), r1=105(y), r2=88(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 105
LDI r2, 88
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
