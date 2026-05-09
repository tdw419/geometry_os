; DESCRIPTION: Composite: Sets a single magenta pixel at (502, 154) then Places a yellow line segment connecting (419, 224) to (409, 201).
; PLAN: r0=502(x), r1=154(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=419(x1), r6=224(y1), r7=409(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 154
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 224
LDI r7, 409
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
