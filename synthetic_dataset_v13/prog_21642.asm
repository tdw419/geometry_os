; DESCRIPTION: Places a yellow 17x63 rectangle at position (370, 81).
; PLAN: r0=370(x), r1=81(y), r2=17(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 81
LDI r2, 17
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
