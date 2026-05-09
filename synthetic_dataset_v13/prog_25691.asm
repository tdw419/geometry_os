; DESCRIPTION: Places a yellow 68x57 rectangle at position (395, 53).
; PLAN: r0=395(x), r1=53(y), r2=68(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 53
LDI r2, 68
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
