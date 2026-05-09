; DESCRIPTION: Composite: Places a cyan line segment connecting (175, 254) to (175, 83) then Sets a single green pixel at (447, 213).
; PLAN: r0=175(x1), r1=254(y1), r2=175(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=213(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 254
LDI r2, 175
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 213
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
