; DESCRIPTION: Composite: Draws a yellow rectangle at (222, 71) with width 34 and height 98 then Sets a single purple pixel at (302, 136).
; PLAN: r0=222(x), r1=71(y), r2=34(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 71
LDI r2, 34
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
