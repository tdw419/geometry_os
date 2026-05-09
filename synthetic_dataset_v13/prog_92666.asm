; DESCRIPTION: Composite: Renders a magenta disk with center (434, 142) and radius 16 then Renders a green line between points (452, 98) and (468, 18) then Places a blue dot at position (489, 224).
; PLAN: r0=434(x), r1=142(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x1), r6=98(y1), r7=468(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=489(x), r11=224(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 142
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 98
LDI r7, 468
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 224
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
