; DESCRIPTION: Places a yellow 53x71 rectangle at position (52, 148).
; PLAN: r0=52(x), r1=148(y), r2=53(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 148
LDI r2, 53
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
