; DESCRIPTION: Places a yellow 51x105 rectangle at position (420, 89).
; PLAN: r0=420(x), r1=89(y), r2=51(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 89
LDI r2, 51
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
