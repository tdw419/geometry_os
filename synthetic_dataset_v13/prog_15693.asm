; DESCRIPTION: Composite: Places a purple circle of radius 33 at center (470, 64) then Sets a single cyan pixel at (21, 223).
; PLAN: r0=470(x), r1=64(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=223(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 64
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 223
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
