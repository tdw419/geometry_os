; DESCRIPTION: Composite: Sets a single purple pixel at (61, 16) then Creates a green circular shape at (186, 95) with radius 25 then Renders a magenta line between points (383, 160) and (216, 223).
; PLAN: r0=61(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=95(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x1), r11=160(y1), r12=216(x2), r13=223(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 95
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 160
LDI r12, 216
LDI r13, 223
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
