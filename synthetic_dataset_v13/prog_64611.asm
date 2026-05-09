; DESCRIPTION: Composite: Sets a single yellow pixel at (59, 255) then Draws a purple line from (280, 206) to (145, 100) then Places a green circle of radius 73 at center (392, 111).
; PLAN: r0=59(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=280(x1), r6=206(y1), r7=145(x2), r8=100(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=111(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 280
LDI r6, 206
LDI r7, 145
LDI r8, 100
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 111
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
