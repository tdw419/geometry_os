; DESCRIPTION: Composite: Places a cyan dot at position (117, 147) then Places a red circle of radius 16 at center (229, 150) then Places a white line segment connecting (325, 7) to (51, 47).
; PLAN: r0=117(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=150(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x1), r11=7(y1), r12=51(x2), r13=47(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 229
LDI r6, 150
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 7
LDI r12, 51
LDI r13, 47
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
