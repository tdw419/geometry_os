; DESCRIPTION: Composite: Places a blue line segment connecting (314, 215) to (77, 98) then Sets a single cyan pixel at (324, 210).
; PLAN: r0=314(x1), r1=215(y1), r2=77(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 215
LDI r2, 77
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
