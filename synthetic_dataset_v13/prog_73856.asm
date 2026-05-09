; DESCRIPTION: Composite: Places a red line segment connecting (241, 56) to (16, 91) then Renders a red disk with center (449, 126) and radius 57 then Places a magenta dot at position (0, 22).
; PLAN: r0=241(x1), r1=56(y1), r2=16(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=126(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=22(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 56
LDI r2, 16
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 126
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 22
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
