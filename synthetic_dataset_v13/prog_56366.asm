; DESCRIPTION: Composite: Renders a cyan line between points (493, 214) and (320, 0) then Places a red dot at position (308, 25) then Places a black circle of radius 63 at center (106, 141).
; PLAN: r0=493(x1), r1=214(y1), r2=320(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=25(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=141(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 214
LDI r2, 320
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 25
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 106
LDI r11, 141
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
