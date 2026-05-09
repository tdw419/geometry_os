; DESCRIPTION: Places a yellow 53x34 rectangle at position (457, 19).
; PLAN: r0=457(x), r1=19(y), r2=53(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 19
LDI r2, 53
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
