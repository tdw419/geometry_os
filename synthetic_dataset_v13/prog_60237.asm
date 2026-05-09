; DESCRIPTION: Composite: Places a green dot at position (209, 38) then Places a purple circle of radius 10 at center (141, 214) then Renders a black line between points (202, 140) and (61, 186).
; PLAN: r0=209(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=214(y), r7=10(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x1), r11=140(y1), r12=61(x2), r13=186(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 141
LDI r6, 214
LDI r7, 10
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 140
LDI r12, 61
LDI r13, 186
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
