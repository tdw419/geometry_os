; DESCRIPTION: Composite: Sets a single cyan pixel at (161, 238) then Renders a white line between points (446, 40) and (384, 51) then Draws a green circle centered at (333, 185) with radius 38.
; PLAN: r0=161(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=40(y1), r7=384(x2), r8=51(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=185(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 446
LDI r6, 40
LDI r7, 384
LDI r8, 51
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 185
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
