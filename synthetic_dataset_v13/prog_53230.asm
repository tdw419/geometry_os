; DESCRIPTION: Composite: Draws a yellow line from (35, 111) to (235, 32) then Places a red circle of radius 41 at center (430, 92).
; PLAN: r0=35(x1), r1=111(y1), r2=235(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=92(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 111
LDI r2, 235
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 92
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
