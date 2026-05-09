; DESCRIPTION: Places a green 31x51 rectangle at position (38, 199).
; PLAN: r0=38(x), r1=199(y), r2=31(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 199
LDI r2, 31
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
