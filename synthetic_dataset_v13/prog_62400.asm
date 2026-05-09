; DESCRIPTION: Composite: Creates a yellow circular shape at (484, 35) with radius 20 then Sets a single cyan pixel at (374, 193) then Renders a white line between points (20, 254) and (466, 32).
; PLAN: r0=484(x), r1=35(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=193(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=20(x1), r11=254(y1), r12=466(x2), r13=32(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 35
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 193
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 20
LDI r11, 254
LDI r12, 466
LDI r13, 32
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
