; DESCRIPTION: Composite: Places a white circle of radius 21 at center (301, 160) then Sets a single cyan pixel at (175, 64).
; PLAN: r0=301(x), r1=160(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=64(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 160
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 64
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
