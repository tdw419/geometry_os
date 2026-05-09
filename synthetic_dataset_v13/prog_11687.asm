; DESCRIPTION: Places a green 19x83 rectangle at position (289, 80).
; PLAN: r0=289(x), r1=80(y), r2=19(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 80
LDI r2, 19
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
