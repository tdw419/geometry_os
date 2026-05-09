; DESCRIPTION: Draws a cyan rectangle at (299, 144) with width 92 and height 35.
; PLAN: r0=299(x), r1=144(y), r2=92(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 144
LDI r2, 92
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
