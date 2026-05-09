; DESCRIPTION: Composite: Renders a magenta line between points (309, 217) and (386, 58) then Renders a magenta disk with center (249, 194) and radius 36 then Places a magenta dot at position (68, 79).
; PLAN: r0=309(x1), r1=217(y1), r2=386(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=194(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=79(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 217
LDI r2, 386
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 194
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 79
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
