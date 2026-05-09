; DESCRIPTION: Composite: Creates a red circular shape at (255, 65) with radius 62 then Sets a single purple pixel at (477, 90) then Renders a white line between points (146, 217) and (180, 77).
; PLAN: r0=255(x), r1=65(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=146(x1), r11=217(y1), r12=180(x2), r13=77(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 65
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 217
LDI r12, 180
LDI r13, 77
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
