; DESCRIPTION: Composite: Places a yellow circle of radius 18 at center (124, 101) then Renders a orange line between points (180, 163) and (290, 61) then Places a magenta dot at position (271, 76).
; PLAN: r0=124(x), r1=101(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x1), r6=163(y1), r7=290(x2), r8=61(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=76(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 101
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 163
LDI r7, 290
LDI r8, 61
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 76
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
