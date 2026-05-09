; DESCRIPTION: Composite: Creates a magenta circular shape at (135, 33) with radius 27 then Sets a single green pixel at (429, 97) then Places a red line segment connecting (89, 190) to (52, 111).
; PLAN: r0=135(x), r1=33(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=97(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=89(x1), r11=190(y1), r12=52(x2), r13=111(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 33
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 97
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 89
LDI r11, 190
LDI r12, 52
LDI r13, 111
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
