; DESCRIPTION: Places a yellow 28x71 rectangle at position (289, 96).
; PLAN: r0=289(x), r1=96(y), r2=28(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 96
LDI r2, 28
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
