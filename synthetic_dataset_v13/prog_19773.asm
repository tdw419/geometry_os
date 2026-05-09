; DESCRIPTION: Composite: Sets a single orange pixel at (183, 164) then Renders a yellow line between points (405, 205) and (175, 220).
; PLAN: r0=183(x), r1=164(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=205(y1), r7=175(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 164
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 405
LDI r6, 205
LDI r7, 175
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
