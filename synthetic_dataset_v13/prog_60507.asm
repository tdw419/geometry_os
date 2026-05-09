; DESCRIPTION: Composite: Sets a single green pixel at (130, 154) then Draws a cyan line from (362, 64) to (178, 135).
; PLAN: r0=130(x), r1=154(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=362(x1), r6=64(y1), r7=178(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 154
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 362
LDI r6, 64
LDI r7, 178
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
