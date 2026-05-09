; DESCRIPTION: Composite: Places a blue line segment connecting (392, 37) to (290, 117) then Renders a red disk with center (456, 195) and radius 17 then Places a white dot at position (485, 99).
; PLAN: r0=392(x1), r1=37(y1), r2=290(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=195(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x), r11=99(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 37
LDI r2, 290
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 195
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 99
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
