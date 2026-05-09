; DESCRIPTION: Composite: Sets a single cyan pixel at (300, 234) then Draws a black line from (422, 81) to (96, 28).
; PLAN: r0=300(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=81(y1), r7=96(x2), r8=28(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 234
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 81
LDI r7, 96
LDI r8, 28
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
