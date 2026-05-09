; DESCRIPTION: Composite: Renders a orange disk with center (214, 182) and radius 57 then Places a orange dot at position (41, 140) then Draws a purple line from (180, 140) to (355, 153).
; PLAN: r0=214(x), r1=182(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=140(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=180(x1), r11=140(y1), r12=355(x2), r13=153(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 182
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 140
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 180
LDI r11, 140
LDI r12, 355
LDI r13, 153
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
