; DESCRIPTION: Composite: Sets a single magenta pixel at (234, 154) then Renders a yellow line between points (339, 170) and (71, 55).
; PLAN: r0=234(x), r1=154(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=170(y1), r7=71(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 154
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 170
LDI r7, 71
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
