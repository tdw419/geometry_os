; DESCRIPTION: Composite: Renders a cyan line between points (84, 215) and (190, 48) then Sets a single cyan pixel at (292, 46).
; PLAN: r0=84(x1), r1=215(y1), r2=190(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=46(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 215
LDI r2, 190
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 46
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
