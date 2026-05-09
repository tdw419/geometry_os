; DESCRIPTION: Places a yellow 119x53 rectangle at position (378, 163).
; PLAN: r0=378(x), r1=163(y), r2=119(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 163
LDI r2, 119
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
