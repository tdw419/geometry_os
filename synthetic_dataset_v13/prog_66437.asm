; DESCRIPTION: Composite: Draws a cyan line from (305, 223) to (111, 28) then Sets a single yellow pixel at (295, 55) then Draws a white circle centered at (178, 186) with radius 51.
; PLAN: r0=305(x1), r1=223(y1), r2=111(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=55(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=178(x), r11=186(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 223
LDI r2, 111
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 55
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 178
LDI r11, 186
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
