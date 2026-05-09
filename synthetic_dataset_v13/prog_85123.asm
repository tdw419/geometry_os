; DESCRIPTION: Places a orange 51x24 rectangle at position (418, 119).
; PLAN: r0=418(x), r1=119(y), r2=51(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 119
LDI r2, 51
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
