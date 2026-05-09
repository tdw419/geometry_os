; DESCRIPTION: Places a green 86x51 rectangle at position (406, 129).
; PLAN: r0=406(x), r1=129(y), r2=86(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 129
LDI r2, 86
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
