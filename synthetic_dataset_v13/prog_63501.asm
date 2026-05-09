; DESCRIPTION: Composite: Sets a single orange pixel at (132, 107) then Creates a blue circular shape at (79, 233) with radius 16 then Renders a green line between points (370, 77) and (448, 193).
; PLAN: r0=132(x), r1=107(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=233(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x1), r11=77(y1), r12=448(x2), r13=193(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 107
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 79
LDI r6, 233
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 77
LDI r12, 448
LDI r13, 193
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
