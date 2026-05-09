; DESCRIPTION: Places a white 15x21 rectangle at position (486, 53).
; PLAN: r0=486(x), r1=53(y), r2=15(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 53
LDI r2, 15
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
