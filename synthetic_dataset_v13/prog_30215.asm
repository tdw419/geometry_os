; DESCRIPTION: Composite: Draws a cyan circle centered at (329, 47) with radius 36 then Renders a red line between points (225, 39) and (341, 87) then Sets a single green pixel at (464, 209).
; PLAN: r0=329(x), r1=47(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x1), r6=39(y1), r7=341(x2), r8=87(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=464(x), r11=209(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 47
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 39
LDI r7, 341
LDI r8, 87
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 209
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
