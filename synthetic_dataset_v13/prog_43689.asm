; DESCRIPTION: Composite: Draws a white line from (277, 87) to (198, 219) then Creates a yellow circular shape at (413, 143) with radius 64.
; PLAN: r0=277(x1), r1=87(y1), r2=198(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=143(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 277
LDI r1, 87
LDI r2, 198
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 143
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
