; DESCRIPTION: Composite: Sets a single green pixel at (209, 18) then Draws a white line from (331, 162) to (238, 58).
; PLAN: r0=209(x), r1=18(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=162(y1), r7=238(x2), r8=58(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 18
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 331
LDI r6, 162
LDI r7, 238
LDI r8, 58
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
