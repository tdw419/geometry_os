; DESCRIPTION: Places a yellow 23x28 rectangle at position (3, 8).
; PLAN: r0=3(x), r1=8(y), r2=23(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 8
LDI r2, 23
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
