; DESCRIPTION: Places a yellow 107x84 rectangle at position (163, 5).
; PLAN: r0=163(x), r1=5(y), r2=107(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 5
LDI r2, 107
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
