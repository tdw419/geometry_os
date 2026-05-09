; DESCRIPTION: Composite: Sets a single green pixel at (436, 217) then Renders a black line between points (380, 104) and (296, 214).
; PLAN: r0=436(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x1), r6=104(y1), r7=296(x2), r8=214(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 104
LDI r7, 296
LDI r8, 214
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
