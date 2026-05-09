; DESCRIPTION: Composite: Draws a green line from (272, 191) to (254, 55) then Sets a single cyan pixel at (266, 46).
; PLAN: r0=272(x1), r1=191(y1), r2=254(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=46(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 191
LDI r2, 254
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 46
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
