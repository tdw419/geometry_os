; DESCRIPTION: Places a yellow 17x45 rectangle at position (490, 7).
; PLAN: r0=490(x), r1=7(y), r2=17(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 7
LDI r2, 17
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
