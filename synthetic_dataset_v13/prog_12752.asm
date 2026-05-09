; DESCRIPTION: Places a purple 78x64 rectangle at position (289, 6).
; PLAN: r0=289(x), r1=6(y), r2=78(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 6
LDI r2, 78
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
