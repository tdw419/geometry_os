; DESCRIPTION: Places a yellow 110x20 rectangle at position (267, 167).
; PLAN: r0=267(x), r1=167(y), r2=110(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 167
LDI r2, 110
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
