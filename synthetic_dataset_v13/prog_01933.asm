; DESCRIPTION: Places a black 90x107 rectangle at position (304, 4).
; PLAN: r0=304(x), r1=4(y), r2=90(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 4
LDI r2, 90
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
