; DESCRIPTION: Places a yellow 118x43 rectangle at position (83, 197).
; PLAN: r0=83(x), r1=197(y), r2=118(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 197
LDI r2, 118
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
