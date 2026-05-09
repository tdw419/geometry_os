; DESCRIPTION: Composite: Places a orange circle of radius 54 at center (73, 163) then Places a cyan line segment connecting (313, 40) to (111, 74) then Sets a single cyan pixel at (421, 71).
; PLAN: r0=73(x), r1=163(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x1), r6=40(y1), r7=111(x2), r8=74(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=71(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 163
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 40
LDI r7, 111
LDI r8, 74
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 71
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
