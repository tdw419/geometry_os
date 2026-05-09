; DESCRIPTION: Composite: Places a magenta dot at position (446, 182) then Renders a cyan disk with center (277, 216) and radius 31.
; PLAN: r0=446(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=216(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 446
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 216
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
