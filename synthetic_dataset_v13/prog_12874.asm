; DESCRIPTION: Composite: Places a cyan line segment connecting (501, 63) to (68, 246) then Places a yellow circle of radius 20 at center (217, 160) then Places a cyan dot at position (28, 199).
; PLAN: r0=501(x1), r1=63(y1), r2=68(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=160(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=199(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 501
LDI r1, 63
LDI r2, 68
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 160
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 199
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
