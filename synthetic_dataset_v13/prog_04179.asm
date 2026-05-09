; DESCRIPTION: Places a yellow 23x70 rectangle at position (113, 149).
; PLAN: r0=113(x), r1=149(y), r2=23(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 149
LDI r2, 23
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
