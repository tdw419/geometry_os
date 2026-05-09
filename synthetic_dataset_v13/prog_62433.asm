; DESCRIPTION: Composite: Renders a orange line between points (475, 208) and (206, 33) then Sets a single white pixel at (337, 28) then Places a cyan circle of radius 77 at center (88, 92).
; PLAN: r0=475(x1), r1=208(y1), r2=206(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=28(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=88(x), r11=92(y), r12=77(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 208
LDI r2, 206
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 28
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 88
LDI r11, 92
LDI r12, 77
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
