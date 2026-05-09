; DESCRIPTION: Places a yellow 25x14 rectangle at position (325, 9).
; PLAN: r0=325(x), r1=9(y), r2=25(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 9
LDI r2, 25
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
