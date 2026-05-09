; DESCRIPTION: Draws a cyan rectangle at (250, 243) with width 35 and height 12.
; PLAN: r0=250(x), r1=243(y), r2=35(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 243
LDI r2, 35
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
