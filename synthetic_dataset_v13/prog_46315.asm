; DESCRIPTION: Places a yellow 56x53 rectangle at position (26, 66).
; PLAN: r0=26(x), r1=66(y), r2=56(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 66
LDI r2, 56
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
