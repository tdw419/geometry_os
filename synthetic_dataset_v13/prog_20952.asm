; DESCRIPTION: Composite: Places a red dot at position (130, 67) then Renders a white disk with center (219, 125) and radius 80 then Draws a blue line from (220, 31) to (368, 119).
; PLAN: r0=130(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=125(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x1), r11=31(y1), r12=368(x2), r13=119(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 219
LDI r6, 125
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 31
LDI r12, 368
LDI r13, 119
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
