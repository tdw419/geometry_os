; DESCRIPTION: Composite: Sets a single yellow pixel at (54, 112) then Creates a cyan circular shape at (295, 90) with radius 27 then Renders a red line between points (473, 87) and (484, 29).
; PLAN: r0=54(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=90(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x1), r11=87(y1), r12=484(x2), r13=29(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 90
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 87
LDI r12, 484
LDI r13, 29
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
