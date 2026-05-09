; DESCRIPTION: Composite: Draws a red circle centered at (175, 191) with radius 25 then Draws a black line from (240, 163) to (92, 161).
; PLAN: r0=175(x), r1=191(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x1), r6=163(y1), r7=92(x2), r8=161(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 191
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 163
LDI r7, 92
LDI r8, 161
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
