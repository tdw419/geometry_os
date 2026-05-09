; DESCRIPTION: Composite: Draws a white line from (23, 27) to (7, 92) then Draws a white circle centered at (111, 161) with radius 74 then Sets a single red pixel at (471, 36).
; PLAN: r0=23(x1), r1=27(y1), r2=7(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=161(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=36(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 27
LDI r2, 7
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 161
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 36
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
