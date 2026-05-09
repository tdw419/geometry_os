; DESCRIPTION: Places a red 26x46 rectangle at position (51, 155).
; PLAN: r0=51(x), r1=155(y), r2=26(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 155
LDI r2, 26
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
