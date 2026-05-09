; DESCRIPTION: Composite: Renders a black line between points (248, 93) and (434, 225) then Sets a single white pixel at (123, 58).
; PLAN: r0=248(x1), r1=93(y1), r2=434(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=58(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 93
LDI r2, 434
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 58
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
