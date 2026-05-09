; DESCRIPTION: Composite: Renders a red line between points (105, 21) and (251, 82) then Draws a white circle centered at (338, 153) with radius 65 then Renders a cyan box of size 36x117 starting at (11, 51).
; PLAN: r0=105(x1), r1=21(y1), r2=251(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=153(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=51(y), r12=36(width), r13=117(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 21
LDI r2, 251
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 153
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 51
LDI r12, 36
LDI r13, 117
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
