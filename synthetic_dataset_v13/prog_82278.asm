; DESCRIPTION: Composite: Renders a green line between points (110, 253) and (470, 107) then Places a green dot at position (317, 69) then Draws a cyan circle centered at (173, 109) with radius 29.
; PLAN: r0=110(x1), r1=253(y1), r2=470(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=69(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=109(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 253
LDI r2, 470
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 69
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 173
LDI r11, 109
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
