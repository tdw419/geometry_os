; DESCRIPTION: Places a green 45x51 rectangle at position (289, 65).
; PLAN: r0=289(x), r1=65(y), r2=45(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 65
LDI r2, 45
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
