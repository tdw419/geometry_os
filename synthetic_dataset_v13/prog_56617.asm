; DESCRIPTION: Places a yellow 95x89 rectangle at position (289, 100).
; PLAN: r0=289(x), r1=100(y), r2=95(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 100
LDI r2, 95
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
