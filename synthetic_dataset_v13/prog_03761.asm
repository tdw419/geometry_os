; DESCRIPTION: Places a yellow 100x94 rectangle at position (302, 32).
; PLAN: r0=302(x), r1=32(y), r2=100(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 32
LDI r2, 100
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
