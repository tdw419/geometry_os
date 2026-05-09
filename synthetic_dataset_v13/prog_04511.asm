; DESCRIPTION: Composite: Sets a single blue pixel at (94, 211) then Renders a magenta disk with center (69, 198) and radius 25 then Renders a cyan line between points (317, 215) and (169, 10).
; PLAN: r0=94(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=198(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=317(x1), r11=215(y1), r12=169(x2), r13=10(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 198
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 317
LDI r11, 215
LDI r12, 169
LDI r13, 10
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
