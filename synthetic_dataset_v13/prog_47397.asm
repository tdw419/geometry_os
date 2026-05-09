; DESCRIPTION: Places a white 68x88 rectangle at position (199, 99).
; PLAN: r0=199(x), r1=99(y), r2=68(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 99
LDI r2, 68
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
