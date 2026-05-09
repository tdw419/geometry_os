; DESCRIPTION: Places a purple 17x18 rectangle at position (0, 211).
; PLAN: r0=0(x), r1=211(y), r2=17(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 211
LDI r2, 17
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
