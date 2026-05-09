; DESCRIPTION: Composite: Sets a single magenta pixel at (218, 225) then Places a green line segment connecting (498, 220) to (347, 253).
; PLAN: r0=218(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=498(x1), r6=220(y1), r7=347(x2), r8=253(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 498
LDI r6, 220
LDI r7, 347
LDI r8, 253
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
