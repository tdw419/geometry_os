; DESCRIPTION: Composite: Creates a orange circular shape at (251, 61) with radius 27 then Draws a yellow line from (451, 247) to (446, 221).
; PLAN: r0=251(x), r1=61(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x1), r6=247(y1), r7=446(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 61
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 247
LDI r7, 446
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
