; DESCRIPTION: Composite: Sets a single green pixel at (14, 104) then Draws a white line from (153, 188) to (290, 209).
; PLAN: r0=14(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=153(x1), r6=188(y1), r7=290(x2), r8=209(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 153
LDI r6, 188
LDI r7, 290
LDI r8, 209
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
