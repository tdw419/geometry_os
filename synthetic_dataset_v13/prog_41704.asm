; DESCRIPTION: Composite: Sets a single orange pixel at (65, 193) then Draws a red line from (291, 180) to (127, 63).
; PLAN: r0=65(x), r1=193(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=180(y1), r7=127(x2), r8=63(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 193
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 291
LDI r6, 180
LDI r7, 127
LDI r8, 63
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
