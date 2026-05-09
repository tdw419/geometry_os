; DESCRIPTION: Places a black 94x26 rectangle at position (176, 168).
; PLAN: r0=176(x), r1=168(y), r2=94(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 168
LDI r2, 94
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
