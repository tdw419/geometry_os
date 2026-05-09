; DESCRIPTION: Composite: Draws a cyan line from (447, 228) to (124, 58) then Sets a single green pixel at (130, 232).
; PLAN: r0=447(x1), r1=228(y1), r2=124(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=232(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 228
LDI r2, 124
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 232
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
