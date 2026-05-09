; DESCRIPTION: Composite: Places a black circle of radius 57 at center (226, 150) then Draws a black line from (426, 109) to (20, 13).
; PLAN: r0=226(x), r1=150(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=109(y1), r7=20(x2), r8=13(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 150
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 109
LDI r7, 20
LDI r8, 13
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
