; DESCRIPTION: Composite: Places a cyan circle of radius 36 at center (198, 78) then Places a yellow dot at position (215, 84).
; PLAN: r0=198(x), r1=78(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=84(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 78
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 84
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
