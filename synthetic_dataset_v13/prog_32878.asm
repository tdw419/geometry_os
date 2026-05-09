; DESCRIPTION: Composite: Renders a cyan line between points (45, 171) and (409, 151) then Renders a blue disk with center (185, 194) and radius 40 then Places a red dot at position (163, 207).
; PLAN: r0=45(x1), r1=171(y1), r2=409(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=194(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x), r11=207(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 171
LDI r2, 409
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 194
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 207
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
