; DESCRIPTION: Places a white 20x58 rectangle at position (82, 78).
; PLAN: r0=82(x), r1=78(y), r2=20(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 78
LDI r2, 20
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
