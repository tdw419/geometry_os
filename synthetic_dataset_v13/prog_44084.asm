; DESCRIPTION: Places a black 91x51 rectangle at position (16, 33).
; PLAN: r0=16(x), r1=33(y), r2=91(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 33
LDI r2, 91
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
