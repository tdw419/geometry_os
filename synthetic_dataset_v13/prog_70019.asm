; DESCRIPTION: Composite: Places a white dot at position (118, 243) then Places a cyan line segment connecting (306, 229) to (32, 190).
; PLAN: r0=118(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=229(y1), r7=32(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 229
LDI r7, 32
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
