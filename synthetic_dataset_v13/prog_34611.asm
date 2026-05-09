; DESCRIPTION: Draws a cyan rectangle at (385, 117) with width 72 and height 92.
; PLAN: r0=385(x), r1=117(y), r2=72(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 117
LDI r2, 72
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
