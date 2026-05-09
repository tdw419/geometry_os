; DESCRIPTION: Composite: Sets a single cyan pixel at (220, 216) then Places a red circle of radius 33 at center (473, 166).
; PLAN: r0=220(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=166(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 473
LDI r6, 166
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
