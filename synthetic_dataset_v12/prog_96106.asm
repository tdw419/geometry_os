; DESCRIPTION: Composite: Places a white line segment connecting (498, 47) to (220, 151) then Creates a green circular shape at (330, 146) with radius 40 then Sets a single orange pixel at (69, 160).
; PLAN: r0=498(x1), r1=47(y1), r2=220(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=146(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=160(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 498
LDI r1, 47
LDI r2, 220
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 146
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 160
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
