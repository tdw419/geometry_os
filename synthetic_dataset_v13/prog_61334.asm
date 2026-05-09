; DESCRIPTION: Places a red 22x53 rectangle at position (389, 45).
; PLAN: r0=389(x), r1=45(y), r2=22(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 45
LDI r2, 22
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
