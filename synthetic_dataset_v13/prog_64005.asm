; DESCRIPTION: Places a black 47x117 rectangle at position (230, 112).
; PLAN: r0=230(x), r1=112(y), r2=47(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 112
LDI r2, 47
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
