; DESCRIPTION: Places a green 81x72 rectangle at position (197, 26).
; PLAN: r0=197(x), r1=26(y), r2=81(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 26
LDI r2, 81
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
