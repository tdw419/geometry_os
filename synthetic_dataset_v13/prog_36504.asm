; DESCRIPTION: Composite: Sets a single white pixel at (145, 237) then Renders a blue line between points (333, 238) and (169, 48).
; PLAN: r0=145(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=238(y1), r7=169(x2), r8=48(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 238
LDI r7, 169
LDI r8, 48
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
