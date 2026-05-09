; DESCRIPTION: Composite: Renders a magenta line between points (295, 227) and (434, 37) then Sets a single white pixel at (146, 121) then Creates a purple circular shape at (352, 115) with radius 60.
; PLAN: r0=295(x1), r1=227(y1), r2=434(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=115(y), r12=60(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 227
LDI r2, 434
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 352
LDI r11, 115
LDI r12, 60
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
