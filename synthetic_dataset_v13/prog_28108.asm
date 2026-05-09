; DESCRIPTION: Places a red 88x31 rectangle at position (172, 73).
; PLAN: r0=172(x), r1=73(y), r2=88(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 73
LDI r2, 88
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
