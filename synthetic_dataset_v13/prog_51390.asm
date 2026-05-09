; DESCRIPTION: Composite: Sets a single black pixel at (363, 127) then Renders a white disk with center (308, 128) and radius 43 then Draws a magenta line from (306, 154) to (292, 43).
; PLAN: r0=363(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=128(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x1), r11=154(y1), r12=292(x2), r13=43(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 308
LDI r6, 128
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 154
LDI r12, 292
LDI r13, 43
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
