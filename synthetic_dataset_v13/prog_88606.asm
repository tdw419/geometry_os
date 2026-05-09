; DESCRIPTION: Composite: Renders a yellow disk with center (196, 85) and radius 73 then Places a cyan dot at position (164, 129) then Renders a orange line between points (221, 87) and (121, 2).
; PLAN: r0=196(x), r1=85(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=129(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=221(x1), r11=87(y1), r12=121(x2), r13=2(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 85
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 129
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 221
LDI r11, 87
LDI r12, 121
LDI r13, 2
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
