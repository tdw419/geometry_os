; DESCRIPTION: Draws a cyan rectangle at (289, 131) with width 92 and height 119.
; PLAN: r0=289(x), r1=131(y), r2=92(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 131
LDI r2, 92
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
