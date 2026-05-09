; DESCRIPTION: Places a black 104x80 rectangle at position (282, 121).
; PLAN: r0=282(x), r1=121(y), r2=104(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 121
LDI r2, 104
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
