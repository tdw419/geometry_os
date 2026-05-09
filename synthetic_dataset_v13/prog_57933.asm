; DESCRIPTION: Composite: Renders a white line between points (295, 178) and (294, 229) then Sets a single yellow pixel at (392, 126).
; PLAN: r0=295(x1), r1=178(y1), r2=294(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=126(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 178
LDI r2, 294
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 126
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
