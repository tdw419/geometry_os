; DESCRIPTION: Places a white 117x74 rectangle at position (136, 102).
; PLAN: r0=136(x), r1=102(y), r2=117(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 102
LDI r2, 117
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
