; DESCRIPTION: Composite: Sets a single magenta pixel at (170, 74) then Places a black line segment connecting (487, 221) to (292, 214).
; PLAN: r0=170(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=487(x1), r6=221(y1), r7=292(x2), r8=214(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 487
LDI r6, 221
LDI r7, 292
LDI r8, 214
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
