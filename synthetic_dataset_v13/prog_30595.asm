; DESCRIPTION: Composite: Renders a cyan disk with center (62, 71) and radius 62 then Places a white dot at position (160, 249) then Renders a purple line between points (51, 246) and (480, 63).
; PLAN: r0=62(x), r1=71(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=249(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=246(y1), r12=480(x2), r13=63(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 71
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 249
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 246
LDI r12, 480
LDI r13, 63
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
