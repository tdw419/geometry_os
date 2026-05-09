; DESCRIPTION: Places a black 104x111 rectangle at position (349, 41).
; PLAN: r0=349(x), r1=41(y), r2=104(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 41
LDI r2, 104
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
