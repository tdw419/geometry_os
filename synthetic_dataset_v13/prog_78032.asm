; DESCRIPTION: Composite: Sets a single cyan pixel at (35, 52) then Renders a orange line between points (150, 236) and (135, 84).
; PLAN: r0=35(x), r1=52(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=150(x1), r6=236(y1), r7=135(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 52
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 150
LDI r6, 236
LDI r7, 135
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
