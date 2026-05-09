; DESCRIPTION: Composite: Draws a white circle centered at (60, 118) with radius 14 then Draws a black line from (118, 180) to (387, 129) then Places a white dot at position (483, 194).
; PLAN: r0=60(x), r1=118(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x1), r6=180(y1), r7=387(x2), r8=129(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=483(x), r11=194(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 118
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 180
LDI r7, 387
LDI r8, 129
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 194
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
