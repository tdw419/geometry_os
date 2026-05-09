; DESCRIPTION: Places a cyan 47x101 rectangle at position (282, 76).
; PLAN: r0=282(x), r1=76(y), r2=47(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 76
LDI r2, 47
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
