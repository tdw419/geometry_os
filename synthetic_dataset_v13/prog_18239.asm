; DESCRIPTION: Places a black 97x18 rectangle at position (178, 215).
; PLAN: r0=178(x), r1=215(y), r2=97(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 215
LDI r2, 97
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
