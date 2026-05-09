; DESCRIPTION: Places a white 66x19 rectangle at position (101, 45).
; PLAN: r0=101(x), r1=45(y), r2=66(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 45
LDI r2, 66
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
