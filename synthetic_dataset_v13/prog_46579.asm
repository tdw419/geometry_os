; DESCRIPTION: Places a white 103x15 rectangle at position (130, 81).
; PLAN: r0=130(x), r1=81(y), r2=103(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 81
LDI r2, 103
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
