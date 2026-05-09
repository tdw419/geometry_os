; DESCRIPTION: Composite: Sets a single red pixel at (271, 68) then Places a blue line segment connecting (400, 74) to (301, 200) then Draws a black circle centered at (293, 179) with radius 42.
; PLAN: r0=271(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=74(y1), r7=301(x2), r8=200(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=179(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 74
LDI r7, 301
LDI r8, 200
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 179
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
