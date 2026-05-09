; DESCRIPTION: Composite: Creates a magenta circular shape at (139, 79) with radius 59 then Sets a single blue pixel at (255, 25) then Draws a yellow line from (331, 82) to (198, 108).
; PLAN: r0=139(x), r1=79(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=25(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=331(x1), r11=82(y1), r12=198(x2), r13=108(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 79
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 25
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 331
LDI r11, 82
LDI r12, 198
LDI r13, 108
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
