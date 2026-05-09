; DESCRIPTION: Composite: Renders a black line between points (367, 45) and (93, 136) then Places a yellow 43x49 rectangle at position (342, 133) then Places a black dot at position (382, 154).
; PLAN: r0=367(x1), r1=45(y1), r2=93(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=133(y), r7=43(width), r8=49(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=154(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 367
LDI r1, 45
LDI r2, 93
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 133
LDI r7, 43
LDI r8, 49
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 154
LDI r12, 0x000000
PSET r10, r11, r12
HALT
