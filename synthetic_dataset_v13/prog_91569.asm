; DESCRIPTION: Composite: Sets a single purple pixel at (293, 66) then Renders a green line between points (445, 181) and (398, 109) then Places a blue circle of radius 73 at center (338, 173).
; PLAN: r0=293(x), r1=66(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=181(y1), r7=398(x2), r8=109(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=173(y), r12=73(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 66
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 181
LDI r7, 398
LDI r8, 109
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 173
LDI r12, 73
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
