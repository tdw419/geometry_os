; DESCRIPTION: Composite: Draws a yellow line from (445, 84) to (492, 57) then Draws a green circle centered at (306, 74) with radius 38 then Sets a single magenta pixel at (327, 112).
; PLAN: r0=445(x1), r1=84(y1), r2=492(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=74(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=327(x), r11=112(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 84
LDI r2, 492
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 74
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 327
LDI r11, 112
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
