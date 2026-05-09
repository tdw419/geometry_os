; DESCRIPTION: Composite: Sets a single green pixel at (332, 166) then Draws a cyan line from (271, 167) to (340, 67).
; PLAN: r0=332(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=167(y1), r7=340(x2), r8=67(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 271
LDI r6, 167
LDI r7, 340
LDI r8, 67
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
