; DESCRIPTION: Composite: Creates a white circular shape at (378, 208) with radius 45 then Places a cyan dot at position (277, 159) then Renders a green line between points (89, 163) and (373, 69).
; PLAN: r0=378(x), r1=208(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=159(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=89(x1), r11=163(y1), r12=373(x2), r13=69(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 208
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 159
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 89
LDI r11, 163
LDI r12, 373
LDI r13, 69
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
