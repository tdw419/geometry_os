; DESCRIPTION: Composite: Renders a green line between points (91, 214) and (261, 91) then Creates a cyan circular shape at (382, 81) with radius 74 then Sets a single purple pixel at (13, 76).
; PLAN: r0=91(x1), r1=214(y1), r2=261(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=81(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=13(x), r11=76(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 214
LDI r2, 261
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 81
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 13
LDI r11, 76
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
