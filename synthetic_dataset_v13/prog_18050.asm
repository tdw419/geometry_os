; DESCRIPTION: Places a white 74x11 rectangle at position (98, 74).
; PLAN: r0=98(x), r1=74(y), r2=74(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 74
LDI r2, 74
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
