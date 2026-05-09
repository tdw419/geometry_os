; DESCRIPTION: Places a white 104x49 rectangle at position (134, 112).
; PLAN: r0=134(x), r1=112(y), r2=104(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 112
LDI r2, 104
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
