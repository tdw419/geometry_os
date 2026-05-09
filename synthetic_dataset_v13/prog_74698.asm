; DESCRIPTION: Composite: Sets a single blue pixel at (320, 193) then Places a green line segment connecting (125, 238) to (268, 224).
; PLAN: r0=320(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=238(y1), r7=268(x2), r8=224(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 238
LDI r7, 268
LDI r8, 224
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
