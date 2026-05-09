; DESCRIPTION: Draws a cyan rectangle at (285, 92) with width 55 and height 12.
; PLAN: r0=285(x), r1=92(y), r2=55(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 92
LDI r2, 55
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
