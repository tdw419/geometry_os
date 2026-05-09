; DESCRIPTION: Composite: Places a cyan circle of radius 47 at center (344, 78) then Places a green dot at position (492, 242).
; PLAN: r0=344(x), r1=78(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=242(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 78
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 242
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
