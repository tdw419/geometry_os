; DESCRIPTION: Places a yellow 57x25 rectangle at position (6, 106).
; PLAN: r0=6(x), r1=106(y), r2=57(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 106
LDI r2, 57
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
