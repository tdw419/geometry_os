; DESCRIPTION: Composite: Sets a single magenta pixel at (249, 220) then Renders a yellow box of size 116x14 starting at (266, 241).
; PLAN: r0=249(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=241(y), r7=116(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 241
LDI r7, 116
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
