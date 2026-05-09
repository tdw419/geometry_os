; DESCRIPTION: Places a yellow 15x44 rectangle at position (302, 72).
; PLAN: r0=302(x), r1=72(y), r2=15(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 72
LDI r2, 15
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
