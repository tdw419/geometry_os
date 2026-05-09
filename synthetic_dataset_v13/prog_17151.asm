; DESCRIPTION: Composite: Places a yellow line segment connecting (32, 200) to (321, 211) then Sets a single cyan pixel at (53, 96).
; PLAN: r0=32(x1), r1=200(y1), r2=321(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=96(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 200
LDI r2, 321
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 96
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
