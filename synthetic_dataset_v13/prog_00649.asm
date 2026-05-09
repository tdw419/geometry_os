; DESCRIPTION: Composite: Places a yellow line segment connecting (479, 100) to (188, 224) then Renders a purple disk with center (466, 200) and radius 45 then Places a cyan dot at position (485, 89).
; PLAN: r0=479(x1), r1=100(y1), r2=188(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=200(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x), r11=89(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 479
LDI r1, 100
LDI r2, 188
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 200
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 89
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
