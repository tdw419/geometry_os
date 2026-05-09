; DESCRIPTION: Composite: Draws a yellow line from (403, 220) to (138, 23) then Sets a single red pixel at (302, 122).
; PLAN: r0=403(x1), r1=220(y1), r2=138(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=122(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 220
LDI r2, 138
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 122
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
