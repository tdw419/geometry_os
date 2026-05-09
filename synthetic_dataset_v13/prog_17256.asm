; DESCRIPTION: Composite: Draws a blue line from (452, 210) to (266, 33) then Draws a black rectangle at (292, 98) with width 39 and height 114 then Places a yellow dot at position (135, 200).
; PLAN: r0=452(x1), r1=210(y1), r2=266(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=98(y), r7=39(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=200(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 210
LDI r2, 266
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 98
LDI r7, 39
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 200
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
