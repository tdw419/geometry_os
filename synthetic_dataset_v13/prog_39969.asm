; DESCRIPTION: Places a black 57x94 rectangle at position (326, 80).
; PLAN: r0=326(x), r1=80(y), r2=57(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 80
LDI r2, 57
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
