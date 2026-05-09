; DESCRIPTION: Composite: Creates a cyan circular shape at (136, 133) with radius 79 then Sets a single cyan pixel at (141, 219) then Renders a magenta line between points (305, 57) and (183, 55).
; PLAN: r0=136(x), r1=133(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=219(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=305(x1), r11=57(y1), r12=183(x2), r13=55(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 133
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 219
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 305
LDI r11, 57
LDI r12, 183
LDI r13, 55
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
