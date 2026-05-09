; DESCRIPTION: Places a white 66x74 rectangle at position (151, 138).
; PLAN: r0=151(x), r1=138(y), r2=66(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 138
LDI r2, 66
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
