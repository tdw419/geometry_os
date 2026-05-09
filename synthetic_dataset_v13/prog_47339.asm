; DESCRIPTION: Composite: Places a white circle of radius 48 at center (449, 48) then Renders a yellow line between points (346, 144) and (241, 17).
; PLAN: r0=449(x), r1=48(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=144(y1), r7=241(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 48
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 144
LDI r7, 241
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
