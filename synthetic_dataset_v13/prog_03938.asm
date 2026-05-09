; DESCRIPTION: Places a green 46x51 rectangle at position (302, 106).
; PLAN: r0=302(x), r1=106(y), r2=46(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 106
LDI r2, 46
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
