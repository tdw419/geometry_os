; DESCRIPTION: Composite: Places a magenta dot at position (121, 249) then Places a red circle of radius 53 at center (298, 178).
; PLAN: r0=121(x), r1=249(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=178(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 249
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 178
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
