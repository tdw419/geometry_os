; DESCRIPTION: Places a white 74x22 rectangle at position (179, 38).
; PLAN: r0=179(x), r1=38(y), r2=74(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 38
LDI r2, 74
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
