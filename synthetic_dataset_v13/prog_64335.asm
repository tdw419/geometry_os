; DESCRIPTION: Composite: Places a red dot at position (168, 102) then Renders a purple disk with center (247, 205) and radius 26.
; PLAN: r0=168(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=205(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 168
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 247
LDI r6, 205
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
