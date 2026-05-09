; DESCRIPTION: Places a green 59x37 rectangle at position (241, 136).
; PLAN: r0=241(x), r1=136(y), r2=59(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 136
LDI r2, 59
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
