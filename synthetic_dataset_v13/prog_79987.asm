; DESCRIPTION: Places a cyan 53x101 rectangle at position (77, 127).
; PLAN: r0=77(x), r1=127(y), r2=53(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 127
LDI r2, 53
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
