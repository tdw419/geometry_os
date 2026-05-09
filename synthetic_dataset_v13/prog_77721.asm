; DESCRIPTION: Places a black 22x74 rectangle at position (438, 74).
; PLAN: r0=438(x), r1=74(y), r2=22(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 74
LDI r2, 22
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
