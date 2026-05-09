; DESCRIPTION: Places a yellow 89x57 rectangle at position (345, 103).
; PLAN: r0=345(x), r1=103(y), r2=89(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 103
LDI r2, 89
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
