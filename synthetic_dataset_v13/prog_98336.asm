; DESCRIPTION: Places a yellow 33x89 rectangle at position (84, 43).
; PLAN: r0=84(x), r1=43(y), r2=33(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 43
LDI r2, 33
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
