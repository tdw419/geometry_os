; DESCRIPTION: Places a cyan 19x119 rectangle at position (287, 30).
; PLAN: r0=287(x), r1=30(y), r2=19(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 30
LDI r2, 19
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
