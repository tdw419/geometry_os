; DESCRIPTION: Draws a blue rectangle at (187, 169) with width 98 and height 25.
; PLAN: r0=187(x), r1=169(y), r2=98(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 169
LDI r2, 98
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
