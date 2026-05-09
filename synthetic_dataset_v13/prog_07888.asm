; DESCRIPTION: Places a yellow 103x94 rectangle at position (122, 51).
; PLAN: r0=122(x), r1=51(y), r2=103(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 51
LDI r2, 103
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
