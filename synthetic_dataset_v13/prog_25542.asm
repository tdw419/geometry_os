; DESCRIPTION: Draws a cyan rectangle at (408, 65) with width 81 and height 80.
; PLAN: r0=408(x), r1=65(y), r2=81(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 65
LDI r2, 81
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
