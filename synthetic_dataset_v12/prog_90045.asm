; DESCRIPTION: Composite: Draws a black rectangle at (362, 54) with width 113 and height 24 then Sets a single cyan pixel at (105, 221).
; PLAN: r0=362(x), r1=54(y), r2=113(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=221(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 54
LDI r2, 113
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 221
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
