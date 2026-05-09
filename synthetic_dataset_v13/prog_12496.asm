; DESCRIPTION: Composite: Draws a white rectangle at (369, 124) with width 35 and height 100 then Sets a single purple pixel at (164, 99).
; PLAN: r0=369(x), r1=124(y), r2=35(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=99(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 124
LDI r2, 35
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 99
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
