; DESCRIPTION: Composite: Renders a purple disk with center (94, 152) and radius 54 then Places a cyan line segment connecting (315, 161) to (120, 55) then Places a yellow dot at position (107, 244).
; PLAN: r0=94(x), r1=152(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=161(y1), r7=120(x2), r8=55(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=244(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 152
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 161
LDI r7, 120
LDI r8, 55
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 244
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
