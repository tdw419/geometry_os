; DESCRIPTION: Places a yellow 40x11 rectangle at position (431, 53).
; PLAN: r0=431(x), r1=53(y), r2=40(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 53
LDI r2, 40
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
