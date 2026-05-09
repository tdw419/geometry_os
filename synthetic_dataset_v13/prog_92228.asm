; DESCRIPTION: Places a black 94x115 rectangle at position (191, 126).
; PLAN: r0=191(x), r1=126(y), r2=94(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 126
LDI r2, 94
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
