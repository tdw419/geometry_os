; DESCRIPTION: Composite: Places a cyan dot at position (463, 4) then Renders a white line between points (312, 94) and (445, 48) then Places a green circle of radius 11 at center (111, 42).
; PLAN: r0=463(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=94(y1), r7=445(x2), r8=48(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=42(y), r12=11(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 463
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 94
LDI r7, 445
LDI r8, 48
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 42
LDI r12, 11
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
