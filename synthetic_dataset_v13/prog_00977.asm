; DESCRIPTION: Places a yellow 51x30 rectangle at position (252, 24).
; PLAN: r0=252(x), r1=24(y), r2=51(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 24
LDI r2, 51
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
