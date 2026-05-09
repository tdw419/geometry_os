; DESCRIPTION: Composite: Creates a black circular shape at (384, 162) with radius 32 then Sets a single orange pixel at (96, 82) then Renders a black line between points (306, 74) and (500, 195).
; PLAN: r0=384(x), r1=162(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=82(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=306(x1), r11=74(y1), r12=500(x2), r13=195(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 162
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 82
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 306
LDI r11, 74
LDI r12, 500
LDI r13, 195
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
