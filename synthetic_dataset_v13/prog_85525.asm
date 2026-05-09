; DESCRIPTION: Places a yellow 25x63 rectangle at position (326, 98).
; PLAN: r0=326(x), r1=98(y), r2=25(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 98
LDI r2, 25
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
