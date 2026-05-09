; DESCRIPTION: Composite: Renders a magenta disk with center (187, 144) and radius 65 then Renders a purple line between points (226, 183) and (21, 29) then Places a red dot at position (295, 5).
; PLAN: r0=187(x), r1=144(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=183(y1), r7=21(x2), r8=29(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=5(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 144
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 183
LDI r7, 21
LDI r8, 29
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 5
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
