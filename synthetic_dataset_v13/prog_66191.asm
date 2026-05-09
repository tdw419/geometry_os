; DESCRIPTION: Places a white 56x45 rectangle at position (2, 53).
; PLAN: r0=2(x), r1=53(y), r2=56(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 53
LDI r2, 56
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
