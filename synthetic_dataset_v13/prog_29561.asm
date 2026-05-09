; DESCRIPTION: Places a green 114x37 rectangle at position (178, 51).
; PLAN: r0=178(x), r1=51(y), r2=114(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 51
LDI r2, 114
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
