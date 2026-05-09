; DESCRIPTION: Places a red 51x37 rectangle at position (296, 3).
; PLAN: r0=296(x), r1=3(y), r2=51(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 3
LDI r2, 51
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
