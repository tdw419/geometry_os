; DESCRIPTION: Composite: Sets a single orange pixel at (272, 143) then Renders a red line between points (410, 64) and (243, 74).
; PLAN: r0=272(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=64(y1), r7=243(x2), r8=74(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 410
LDI r6, 64
LDI r7, 243
LDI r8, 74
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
