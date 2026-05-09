; DESCRIPTION: Places a white 11x114 rectangle at position (460, 81).
; PLAN: r0=460(x), r1=81(y), r2=11(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 81
LDI r2, 11
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
