; DESCRIPTION: Places a yellow 100x61 rectangle at position (302, 40).
; PLAN: r0=302(x), r1=40(y), r2=100(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 40
LDI r2, 100
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
