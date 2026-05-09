; DESCRIPTION: Composite: Sets a single green pixel at (437, 21) then Renders a black line between points (485, 50) and (273, 236).
; PLAN: r0=437(x), r1=21(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=50(y1), r7=273(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 21
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 485
LDI r6, 50
LDI r7, 273
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
