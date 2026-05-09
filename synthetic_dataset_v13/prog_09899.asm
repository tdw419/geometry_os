; DESCRIPTION: Places a green 31x31 rectangle at position (310, 156).
; PLAN: r0=310(x), r1=156(y), r2=31(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 156
LDI r2, 31
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
