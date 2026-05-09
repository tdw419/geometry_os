; DESCRIPTION: Composite: Places a yellow dot at position (65, 43) then Places a yellow circle of radius 27 at center (373, 151) then Renders a purple line between points (35, 76) and (410, 92).
; PLAN: r0=65(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=151(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x1), r11=76(y1), r12=410(x2), r13=92(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 373
LDI r6, 151
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 76
LDI r12, 410
LDI r13, 92
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
