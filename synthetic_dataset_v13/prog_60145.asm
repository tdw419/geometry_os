; DESCRIPTION: Composite: Places a cyan dot at position (366, 178) then Renders a white line between points (189, 2) and (439, 124) then Places a black circle of radius 48 at center (189, 189).
; PLAN: r0=366(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=2(y1), r7=439(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=189(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 2
LDI r7, 439
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 189
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
