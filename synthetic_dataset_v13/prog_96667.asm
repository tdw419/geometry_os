; DESCRIPTION: Places a green 25x24 rectangle at position (471, 31).
; PLAN: r0=471(x), r1=31(y), r2=25(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 31
LDI r2, 25
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
