; DESCRIPTION: Composite: Sets a single magenta pixel at (503, 247) then Places a yellow line segment connecting (78, 242) to (262, 28).
; PLAN: r0=503(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=242(y1), r7=262(x2), r8=28(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 242
LDI r7, 262
LDI r8, 28
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
