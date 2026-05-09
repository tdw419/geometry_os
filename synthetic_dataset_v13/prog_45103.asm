; DESCRIPTION: Places a yellow 108x53 rectangle at position (172, 18).
; PLAN: r0=172(x), r1=18(y), r2=108(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 18
LDI r2, 108
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
