; DESCRIPTION: Places a black 94x78 rectangle at position (140, 50).
; PLAN: r0=140(x), r1=50(y), r2=94(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 50
LDI r2, 94
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
