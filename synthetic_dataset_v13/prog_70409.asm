; DESCRIPTION: Composite: Places a green dot at position (349, 117) then Places a cyan circle of radius 64 at center (375, 152).
; PLAN: r0=349(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=152(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 117
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 375
LDI r6, 152
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
