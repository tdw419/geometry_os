; DESCRIPTION: Composite: Draws a magenta line from (450, 212) to (410, 150) then Sets a single red pixel at (71, 38).
; PLAN: r0=450(x1), r1=212(y1), r2=410(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=38(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 212
LDI r2, 410
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 38
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
