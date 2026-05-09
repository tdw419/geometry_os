; DESCRIPTION: Places a white 46x74 rectangle at position (463, 35).
; PLAN: r0=463(x), r1=35(y), r2=46(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 35
LDI r2, 46
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
