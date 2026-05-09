; DESCRIPTION: Composite: Sets a single red pixel at (352, 252) then Places a cyan circle of radius 13 at center (302, 226) then Places a white line segment connecting (77, 127) to (171, 59).
; PLAN: r0=352(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=226(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x1), r11=127(y1), r12=171(x2), r13=59(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 226
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 127
LDI r12, 171
LDI r13, 59
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
