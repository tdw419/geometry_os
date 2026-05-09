; DESCRIPTION: Places a black 50x57 rectangle at position (153, 94).
; PLAN: r0=153(x), r1=94(y), r2=50(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 94
LDI r2, 50
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
