; DESCRIPTION: Composite: Places a yellow dot at position (363, 173) then Renders a purple disk with center (182, 42) and radius 19.
; PLAN: r0=363(x), r1=173(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=42(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 173
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 182
LDI r6, 42
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
