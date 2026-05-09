; DESCRIPTION: Composite: Renders a red line between points (356, 250) and (98, 162) then Creates a cyan circular shape at (443, 107) with radius 21 then Sets a single white pixel at (377, 36).
; PLAN: r0=356(x1), r1=250(y1), r2=98(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=107(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=36(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 250
LDI r2, 98
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 107
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 36
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
