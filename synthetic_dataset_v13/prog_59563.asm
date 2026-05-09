; DESCRIPTION: Places a yellow 49x74 rectangle at position (172, 97).
; PLAN: r0=172(x), r1=97(y), r2=49(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 97
LDI r2, 49
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
