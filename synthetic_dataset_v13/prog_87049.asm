; DESCRIPTION: Places a white 49x26 rectangle at position (389, 95).
; PLAN: r0=389(x), r1=95(y), r2=49(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 95
LDI r2, 49
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
