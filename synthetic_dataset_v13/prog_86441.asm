; DESCRIPTION: Places a black 79x101 rectangle at position (180, 139).
; PLAN: r0=180(x), r1=139(y), r2=79(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 139
LDI r2, 79
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
