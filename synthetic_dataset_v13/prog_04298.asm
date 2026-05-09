; DESCRIPTION: Places a blue 83x51 rectangle at position (129, 109).
; PLAN: r0=129(x), r1=109(y), r2=83(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 109
LDI r2, 83
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
