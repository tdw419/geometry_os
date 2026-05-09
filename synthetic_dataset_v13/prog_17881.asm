; DESCRIPTION: Composite: Sets a single cyan pixel at (424, 173) then Places a black line segment connecting (164, 237) to (321, 79).
; PLAN: r0=424(x), r1=173(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=237(y1), r7=321(x2), r8=79(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 173
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 164
LDI r6, 237
LDI r7, 321
LDI r8, 79
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
