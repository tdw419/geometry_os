; DESCRIPTION: Composite: Draws a red line from (208, 169) to (401, 3) then Places a cyan circle of radius 39 at center (339, 124) then Sets a single black pixel at (427, 33).
; PLAN: r0=208(x1), r1=169(y1), r2=401(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=124(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x), r11=33(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 169
LDI r2, 401
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 124
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 33
LDI r12, 0x000000
PSET r10, r11, r12
HALT
