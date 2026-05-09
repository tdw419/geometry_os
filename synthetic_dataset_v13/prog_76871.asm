; DESCRIPTION: Places a black 20x39 rectangle at position (289, 157).
; PLAN: r0=289(x), r1=157(y), r2=20(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 157
LDI r2, 20
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
