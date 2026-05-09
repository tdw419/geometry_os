; DESCRIPTION: Composite: Renders a cyan disk with center (271, 169) and radius 77 then Draws a magenta line from (492, 44) to (93, 111) then Sets a single magenta pixel at (191, 55).
; PLAN: r0=271(x), r1=169(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=44(y1), r7=93(x2), r8=111(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=55(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 169
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 44
LDI r7, 93
LDI r8, 111
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 55
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
