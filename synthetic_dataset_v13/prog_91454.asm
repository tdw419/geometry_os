; DESCRIPTION: Composite: Places a cyan circle of radius 38 at center (298, 47) then Sets a single purple pixel at (127, 252).
; PLAN: r0=298(x), r1=47(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=252(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 47
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 252
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
