; DESCRIPTION: Draws a cyan rectangle at (349, 33) with width 80 and height 92.
; PLAN: r0=349(x), r1=33(y), r2=80(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 33
LDI r2, 80
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
