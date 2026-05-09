; DESCRIPTION: Composite: Renders a black line between points (265, 4) and (271, 95) then Places a magenta dot at position (54, 16) then Renders a black disk with center (146, 132) and radius 17.
; PLAN: r0=265(x1), r1=4(y1), r2=271(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=16(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=132(y), r12=17(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 4
LDI r2, 271
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 16
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 132
LDI r12, 17
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
