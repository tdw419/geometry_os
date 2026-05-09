; DESCRIPTION: Composite: Renders a orange disk with center (85, 152) and radius 78 then Renders a white line between points (445, 147) and (271, 187) then Places a blue dot at position (179, 71).
; PLAN: r0=85(x), r1=152(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x1), r6=147(y1), r7=271(x2), r8=187(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=71(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 152
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 147
LDI r7, 271
LDI r8, 187
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 71
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
