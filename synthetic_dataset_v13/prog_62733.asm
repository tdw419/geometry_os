; DESCRIPTION: Composite: Draws a green line from (152, 117) to (334, 195) then Places a cyan circle of radius 38 at center (163, 214) then Sets a single cyan pixel at (487, 65).
; PLAN: r0=152(x1), r1=117(y1), r2=334(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=214(y), r7=38(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=487(x), r11=65(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 117
LDI r2, 334
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 214
LDI r7, 38
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 487
LDI r11, 65
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
