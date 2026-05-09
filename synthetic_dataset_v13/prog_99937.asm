; DESCRIPTION: Places a red 66x20 rectangle at position (138, 36).
; PLAN: r0=138(x), r1=36(y), r2=66(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 36
LDI r2, 66
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
