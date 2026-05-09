; DESCRIPTION: Composite: Renders a red disk with center (262, 131) and radius 74 then Places a white dot at position (182, 20).
; PLAN: r0=262(x), r1=131(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=20(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 131
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 20
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
