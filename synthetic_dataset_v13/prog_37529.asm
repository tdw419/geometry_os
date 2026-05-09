; DESCRIPTION: Places a cyan 19x88 rectangle at position (238, 134).
; PLAN: r0=238(x), r1=134(y), r2=19(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 134
LDI r2, 19
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
