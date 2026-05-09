; DESCRIPTION: Places a cyan 17x120 rectangle at position (149, 53).
; PLAN: r0=149(x), r1=53(y), r2=17(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 53
LDI r2, 17
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
