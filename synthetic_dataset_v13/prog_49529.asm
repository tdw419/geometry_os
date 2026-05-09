; DESCRIPTION: Places a white 45x103 rectangle at position (34, 20).
; PLAN: r0=34(x), r1=20(y), r2=45(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 20
LDI r2, 45
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
