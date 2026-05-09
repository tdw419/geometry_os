; DESCRIPTION: Composite: Places a yellow dot at position (38, 94) then Places a purple line segment connecting (52, 79) to (243, 94).
; PLAN: r0=38(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=79(y1), r7=243(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 52
LDI r6, 79
LDI r7, 243
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
