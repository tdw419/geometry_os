; DESCRIPTION: Places a black 81x34 rectangle at position (387, 161).
; PLAN: r0=387(x), r1=161(y), r2=81(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 161
LDI r2, 81
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
