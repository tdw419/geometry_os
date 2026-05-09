; DESCRIPTION: Composite: Draws a blue line from (85, 224) to (131, 52) then Sets a single green pixel at (243, 24).
; PLAN: r0=85(x1), r1=224(y1), r2=131(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=24(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 224
LDI r2, 131
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 24
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
