; DESCRIPTION: Places a green 26x98 rectangle at position (289, 90).
; PLAN: r0=289(x), r1=90(y), r2=26(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 90
LDI r2, 26
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
