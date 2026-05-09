; DESCRIPTION: Places a black 115x76 rectangle at position (385, 117).
; PLAN: r0=385(x), r1=117(y), r2=115(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 117
LDI r2, 115
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
