; DESCRIPTION: Composite: Sets a single orange pixel at (236, 43) then Places a yellow line segment connecting (242, 49) to (487, 35).
; PLAN: r0=236(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=49(y1), r7=487(x2), r8=35(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 242
LDI r6, 49
LDI r7, 487
LDI r8, 35
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
