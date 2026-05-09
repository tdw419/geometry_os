; DESCRIPTION: Places a white 19x95 rectangle at position (452, 1).
; PLAN: r0=452(x), r1=1(y), r2=19(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 1
LDI r2, 19
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
