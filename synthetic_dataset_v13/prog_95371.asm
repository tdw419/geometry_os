; DESCRIPTION: Places a yellow 66x110 rectangle at position (296, 53).
; PLAN: r0=296(x), r1=53(y), r2=66(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 53
LDI r2, 66
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
