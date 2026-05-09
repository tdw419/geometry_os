; DESCRIPTION: Places a black 70x103 rectangle at position (425, 14).
; PLAN: r0=425(x), r1=14(y), r2=70(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 14
LDI r2, 70
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
