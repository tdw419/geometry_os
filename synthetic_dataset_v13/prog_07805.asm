; DESCRIPTION: Composite: Places a cyan circle of radius 49 at center (189, 95) then Places a magenta dot at position (7, 220) then Renders a black line between points (248, 61) and (50, 15).
; PLAN: r0=189(x), r1=95(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=220(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=248(x1), r11=61(y1), r12=50(x2), r13=15(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 95
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 220
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 61
LDI r12, 50
LDI r13, 15
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
