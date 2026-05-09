; DESCRIPTION: Draws a cyan rectangle at (145, 120) with width 56 and height 73.
; PLAN: r0=145(x), r1=120(y), r2=56(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 120
LDI r2, 56
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
