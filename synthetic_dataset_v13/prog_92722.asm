; DESCRIPTION: Composite: Places a cyan circle of radius 79 at center (101, 164) then Renders a magenta line between points (365, 11) and (486, 136) then Places a cyan dot at position (57, 23).
; PLAN: r0=101(x), r1=164(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x1), r6=11(y1), r7=486(x2), r8=136(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=23(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 164
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 11
LDI r7, 486
LDI r8, 136
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 23
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
