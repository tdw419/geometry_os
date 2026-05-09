; DESCRIPTION: Composite: Renders a green disk with center (135, 102) and radius 60 then Places a blue line segment connecting (293, 24) to (16, 149) then Places a purple dot at position (150, 188).
; PLAN: r0=135(x), r1=102(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x1), r6=24(y1), r7=16(x2), r8=149(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=188(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 102
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 24
LDI r7, 16
LDI r8, 149
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 188
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
