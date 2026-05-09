; DESCRIPTION: Composite: Draws a red circle centered at (294, 116) with radius 74 then Renders a red line between points (293, 91) and (415, 121) then Sets a single white pixel at (230, 39).
; PLAN: r0=294(x), r1=116(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x1), r6=91(y1), r7=415(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=39(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 116
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 91
LDI r7, 415
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 39
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
