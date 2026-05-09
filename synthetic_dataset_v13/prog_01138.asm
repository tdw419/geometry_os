; DESCRIPTION: Composite: Draws a black circle centered at (271, 180) with radius 64 then Draws a blue line from (193, 221) to (359, 77).
; PLAN: r0=271(x), r1=180(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=221(y1), r7=359(x2), r8=77(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 180
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 221
LDI r7, 359
LDI r8, 77
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
