; DESCRIPTION: Draws a cyan rectangle at (30, 127) with width 83 and height 108.
; PLAN: r0=30(x), r1=127(y), r2=83(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 127
LDI r2, 83
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
