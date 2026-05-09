; DESCRIPTION: Places a black 65x53 rectangle at position (324, 48).
; PLAN: r0=324(x), r1=48(y), r2=65(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 48
LDI r2, 65
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
