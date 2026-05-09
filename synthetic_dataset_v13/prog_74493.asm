; DESCRIPTION: Places a yellow 11x110 rectangle at position (121, 3).
; PLAN: r0=121(x), r1=3(y), r2=11(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 3
LDI r2, 11
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
