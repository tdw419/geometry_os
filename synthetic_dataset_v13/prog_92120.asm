; DESCRIPTION: Places a red 22x13 rectangle at position (11, 197).
; PLAN: r0=11(x), r1=197(y), r2=22(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 197
LDI r2, 22
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
