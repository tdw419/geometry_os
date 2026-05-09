; DESCRIPTION: Places a yellow 98x17 rectangle at position (359, 99).
; PLAN: r0=359(x), r1=99(y), r2=98(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 99
LDI r2, 98
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
