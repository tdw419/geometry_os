; DESCRIPTION: Composite: Draws a orange line from (16, 33) to (339, 147) then Renders a purple disk with center (169, 210) and radius 41 then Places a cyan dot at position (220, 71).
; PLAN: r0=16(x1), r1=33(y1), r2=339(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=210(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x), r11=71(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 33
LDI r2, 339
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 210
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 71
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
