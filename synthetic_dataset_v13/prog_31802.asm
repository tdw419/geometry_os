; DESCRIPTION: Draws a green rectangle at (120, 149) with width 99 and height 95.
; PLAN: r0=120(x), r1=149(y), r2=99(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 149
LDI r2, 99
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
