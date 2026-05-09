; DESCRIPTION: Places a black 31x103 rectangle at position (372, 7).
; PLAN: r0=372(x), r1=7(y), r2=31(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 7
LDI r2, 31
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
