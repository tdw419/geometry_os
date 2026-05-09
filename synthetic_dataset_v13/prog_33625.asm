; DESCRIPTION: Composite: Sets a single cyan pixel at (262, 205) then Places a yellow circle of radius 41 at center (440, 125).
; PLAN: r0=262(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=125(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 205
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 125
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
