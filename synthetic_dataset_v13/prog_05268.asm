; DESCRIPTION: Composite: Places a yellow line segment connecting (37, 211) to (275, 202) then Sets a single cyan pixel at (395, 13).
; PLAN: r0=37(x1), r1=211(y1), r2=275(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=13(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 211
LDI r2, 275
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 13
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
