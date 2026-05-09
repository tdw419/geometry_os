; DESCRIPTION: Composite: Places a black dot at position (48, 222) then Renders a cyan line between points (312, 115) and (39, 194) then Places a green circle of radius 10 at center (150, 124).
; PLAN: r0=48(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=115(y1), r7=39(x2), r8=194(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=124(y), r12=10(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 312
LDI r6, 115
LDI r7, 39
LDI r8, 194
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 124
LDI r12, 10
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
