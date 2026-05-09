; DESCRIPTION: Places a green 64x107 rectangle at position (238, 76).
; PLAN: r0=238(x), r1=76(y), r2=64(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 76
LDI r2, 64
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
