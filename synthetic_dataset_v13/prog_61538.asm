; DESCRIPTION: Composite: Draws a red circle centered at (313, 135) with radius 77 then Renders a magenta line between points (121, 221) and (304, 11) then Sets a single black pixel at (510, 253).
; PLAN: r0=313(x), r1=135(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x1), r6=221(y1), r7=304(x2), r8=11(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=510(x), r11=253(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 135
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 221
LDI r7, 304
LDI r8, 11
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 510
LDI r11, 253
LDI r12, 0x000000
PSET r10, r11, r12
HALT
