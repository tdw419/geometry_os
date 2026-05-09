; DESCRIPTION: Places a green 73x53 rectangle at position (223, 6).
; PLAN: r0=223(x), r1=6(y), r2=73(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 6
LDI r2, 73
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
