; DESCRIPTION: Composite: Places a white line segment connecting (256, 93) to (439, 30) then Draws a white circle centered at (341, 74) with radius 51 then Sets a single red pixel at (42, 142).
; PLAN: r0=256(x1), r1=93(y1), r2=439(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=74(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x), r11=142(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 93
LDI r2, 439
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 74
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 142
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
