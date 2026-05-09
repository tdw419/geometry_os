; DESCRIPTION: Places a green 51x58 rectangle at position (24, 153).
; PLAN: r0=24(x), r1=153(y), r2=51(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 153
LDI r2, 51
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
