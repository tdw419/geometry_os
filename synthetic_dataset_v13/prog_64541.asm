; DESCRIPTION: Composite: Renders a red line between points (335, 40) and (59, 145) then Places a green dot at position (499, 55).
; PLAN: r0=335(x1), r1=40(y1), r2=59(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=55(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 40
LDI r2, 59
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 55
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
