; DESCRIPTION: Places a yellow 105x93 rectangle at position (266, 129).
; PLAN: r0=266(x), r1=129(y), r2=105(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 129
LDI r2, 105
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
