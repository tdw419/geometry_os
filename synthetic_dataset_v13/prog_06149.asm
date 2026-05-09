; DESCRIPTION: Composite: Renders a cyan line between points (367, 240) and (144, 35) then Sets a single green pixel at (410, 175) then Creates a red circular shape at (138, 59) with radius 26.
; PLAN: r0=367(x1), r1=240(y1), r2=144(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=175(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=59(y), r12=26(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 240
LDI r2, 144
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 175
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 138
LDI r11, 59
LDI r12, 26
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
