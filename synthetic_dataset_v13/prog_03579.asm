; DESCRIPTION: Draws a cyan rectangle at (411, 131) with width 85 and height 92.
; PLAN: r0=411(x), r1=131(y), r2=85(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 131
LDI r2, 85
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
