; DESCRIPTION: Composite: Sets a single orange pixel at (28, 208) then Places a green circle of radius 38 at center (333, 117).
; PLAN: r0=28(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=117(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 333
LDI r6, 117
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
