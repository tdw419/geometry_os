; DESCRIPTION: Composite: Creates a blue circular shape at (216, 129) with radius 69 then Renders a green line between points (474, 215) and (162, 115) then Sets a single orange pixel at (237, 236).
; PLAN: r0=216(x), r1=129(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=215(y1), r7=162(x2), r8=115(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=236(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 129
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 215
LDI r7, 162
LDI r8, 115
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 236
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
