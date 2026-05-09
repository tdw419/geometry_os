; DESCRIPTION: Composite: Places a green dot at position (482, 157) then Draws a white line from (445, 173) to (506, 222) then Renders a purple disk with center (178, 136) and radius 48.
; PLAN: r0=482(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=173(y1), r7=506(x2), r8=222(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=136(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 445
LDI r6, 173
LDI r7, 506
LDI r8, 222
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 136
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
