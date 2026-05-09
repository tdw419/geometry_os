; DESCRIPTION: Composite: Draws a cyan line from (108, 60) to (378, 147) then Renders a purple disk with center (445, 107) and radius 36 then Sets a single green pixel at (90, 67).
; PLAN: r0=108(x1), r1=60(y1), r2=378(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=107(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x), r11=67(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 60
LDI r2, 378
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 107
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 67
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
