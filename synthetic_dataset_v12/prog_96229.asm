; DESCRIPTION: Composite: Sets a single purple pixel at (124, 208) then Renders a magenta line between points (114, 59) and (199, 171) then Renders a blue disk with center (225, 82) and radius 46.
; PLAN: r0=124(x), r1=208(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=59(y1), r7=199(x2), r8=171(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=82(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 124
LDI r1, 208
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 59
LDI r7, 199
LDI r8, 171
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 82
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
