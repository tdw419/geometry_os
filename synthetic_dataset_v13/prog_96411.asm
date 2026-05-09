; DESCRIPTION: Composite: Renders a yellow line between points (218, 27) and (65, 71) then Sets a single cyan pixel at (348, 156).
; PLAN: r0=218(x1), r1=27(y1), r2=65(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=156(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 27
LDI r2, 65
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 156
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
