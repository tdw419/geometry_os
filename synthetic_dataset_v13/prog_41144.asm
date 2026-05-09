; DESCRIPTION: Composite: Sets a single orange pixel at (393, 206) then Draws a cyan line from (4, 108) to (290, 58).
; PLAN: r0=393(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=108(y1), r7=290(x2), r8=58(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 4
LDI r6, 108
LDI r7, 290
LDI r8, 58
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
