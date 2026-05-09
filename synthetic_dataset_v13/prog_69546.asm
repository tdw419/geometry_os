; DESCRIPTION: Composite: Sets a single cyan pixel at (401, 160) then Places a white circle of radius 15 at center (484, 112) then Draws a yellow line from (146, 59) to (355, 223).
; PLAN: r0=401(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=484(x), r6=112(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x1), r11=59(y1), r12=355(x2), r13=223(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 484
LDI r6, 112
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 59
LDI r12, 355
LDI r13, 223
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
