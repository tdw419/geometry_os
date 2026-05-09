; DESCRIPTION: Places a black 45x54 rectangle at position (82, 171).
; PLAN: r0=82(x), r1=171(y), r2=45(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 171
LDI r2, 45
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
