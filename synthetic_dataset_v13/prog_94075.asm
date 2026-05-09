; DESCRIPTION: Composite: Renders a white disk with center (260, 193) and radius 54 then Draws a blue line from (300, 115) to (345, 111) then Places a purple dot at position (335, 148).
; PLAN: r0=260(x), r1=193(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=115(y1), r7=345(x2), r8=111(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=148(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 193
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 115
LDI r7, 345
LDI r8, 111
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 148
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
