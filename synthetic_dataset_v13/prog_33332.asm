; DESCRIPTION: Composite: Sets a single purple pixel at (446, 204) then Renders a green box of size 51x80 starting at (124, 169).
; PLAN: r0=446(x), r1=204(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=169(y), r7=51(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 204
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 169
LDI r7, 51
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
