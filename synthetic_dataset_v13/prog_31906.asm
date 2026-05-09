; DESCRIPTION: Composite: Places a blue circle of radius 23 at center (352, 107) then Places a orange dot at position (297, 101) then Renders a white line between points (240, 168) and (499, 48).
; PLAN: r0=352(x), r1=107(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=101(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=240(x1), r11=168(y1), r12=499(x2), r13=48(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 107
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 101
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 240
LDI r11, 168
LDI r12, 499
LDI r13, 48
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
