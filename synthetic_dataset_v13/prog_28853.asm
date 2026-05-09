; DESCRIPTION: Places a yellow 49x98 rectangle at position (149, 47).
; PLAN: r0=149(x), r1=47(y), r2=49(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 47
LDI r2, 49
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
