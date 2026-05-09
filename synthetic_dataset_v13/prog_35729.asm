; DESCRIPTION: Composite: Places a magenta circle of radius 80 at center (403, 94) then Sets a single magenta pixel at (72, 236).
; PLAN: r0=403(x), r1=94(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=236(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 94
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 236
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
