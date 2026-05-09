; DESCRIPTION: Places a white 19x50 rectangle at position (428, 72).
; PLAN: r0=428(x), r1=72(y), r2=19(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 72
LDI r2, 19
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
