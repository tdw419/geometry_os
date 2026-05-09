; DESCRIPTION: Places a red 13x51 rectangle at position (436, 62).
; PLAN: r0=436(x), r1=62(y), r2=13(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 62
LDI r2, 13
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
