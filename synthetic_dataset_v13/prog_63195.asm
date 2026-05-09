; DESCRIPTION: Composite: Renders a green line between points (255, 9) and (243, 179) then Sets a single orange pixel at (154, 177).
; PLAN: r0=255(x1), r1=9(y1), r2=243(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=177(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 9
LDI r2, 243
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 177
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
