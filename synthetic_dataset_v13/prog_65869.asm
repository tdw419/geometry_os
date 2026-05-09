; DESCRIPTION: Places a yellow 94x57 rectangle at position (289, 30).
; PLAN: r0=289(x), r1=30(y), r2=94(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 30
LDI r2, 94
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
