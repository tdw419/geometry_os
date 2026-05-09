; DESCRIPTION: Places a black 31x117 rectangle at position (349, 50).
; PLAN: r0=349(x), r1=50(y), r2=31(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 50
LDI r2, 31
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
