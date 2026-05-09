; DESCRIPTION: Composite: Places a blue circle of radius 47 at center (404, 195) then Sets a single red pixel at (291, 200).
; PLAN: r0=404(x), r1=195(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 195
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
