; DESCRIPTION: Composite: Renders a yellow line between points (305, 213) and (374, 38) then Places a purple dot at position (409, 3) then Renders a red disk with center (165, 103) and radius 64.
; PLAN: r0=305(x1), r1=213(y1), r2=374(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=3(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=103(y), r12=64(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 213
LDI r2, 374
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 3
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 103
LDI r12, 64
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
