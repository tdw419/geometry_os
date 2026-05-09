; DESCRIPTION: Composite: Sets a single blue pixel at (234, 10) then Renders a magenta disk with center (186, 97) and radius 45 then Renders a white line between points (474, 27) and (450, 151).
; PLAN: r0=234(x), r1=10(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=97(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x1), r11=27(y1), r12=450(x2), r13=151(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 10
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 97
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 27
LDI r12, 450
LDI r13, 151
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
