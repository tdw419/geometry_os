; DESCRIPTION: Composite: Draws a orange circle centered at (472, 105) with radius 32 then Renders a black line between points (54, 146) and (369, 221) then Places a red dot at position (92, 57).
; PLAN: r0=472(x), r1=105(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x1), r6=146(y1), r7=369(x2), r8=221(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=57(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 472
LDI r1, 105
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 146
LDI r7, 369
LDI r8, 221
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 57
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
