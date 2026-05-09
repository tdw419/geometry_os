; DESCRIPTION: Composite: Draws a blue rectangle at (362, 113) with width 46 and height 95 then Sets a single blue pixel at (298, 84).
; PLAN: r0=362(x), r1=113(y), r2=46(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=84(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 113
LDI r2, 46
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 84
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
