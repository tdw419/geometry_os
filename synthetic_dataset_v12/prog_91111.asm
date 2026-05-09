; DESCRIPTION: Composite: Draws a green rectangle at (327, 192) with width 51 and height 25 then Places a black dot at position (20, 169).
; PLAN: r0=327(x), r1=192(y), r2=51(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 192
LDI r2, 51
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
HALT
