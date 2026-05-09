; DESCRIPTION: Places a yellow 18x94 rectangle at position (52, 33).
; PLAN: r0=52(x), r1=33(y), r2=18(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 33
LDI r2, 18
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
