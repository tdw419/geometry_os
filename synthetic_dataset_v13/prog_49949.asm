; DESCRIPTION: Composite: Places a cyan circle of radius 17 at center (485, 171) then Sets a single cyan pixel at (401, 241) then Places a green line segment connecting (9, 30) to (285, 19).
; PLAN: r0=485(x), r1=171(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=241(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=9(x1), r11=30(y1), r12=285(x2), r13=19(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 171
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 241
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 9
LDI r11, 30
LDI r12, 285
LDI r13, 19
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
