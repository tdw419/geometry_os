; DESCRIPTION: Composite: Draws a green rectangle at (370, 85) with width 92 and height 54 then Sets a single magenta pixel at (384, 1).
; PLAN: r0=370(x), r1=85(y), r2=92(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=1(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 85
LDI r2, 92
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 1
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
